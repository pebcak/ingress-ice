FROM wernight/phantomjs

# Usage:
# $ docker build -t ingress-ice .
# $ docker run -v /path/to/.ingress-ice.conf:/.ingress-ice.conf -v /path/to/screenshots/:/screenshots ingress-ice

USER root
WORKDIR /

RUN echo "deb http://http.us.debian.org/debian/ testing non-free contrib main" >> /etc/apt/sources.list
RUN apt update
RUN apt install imagemagick mencoder -y

MAINTAINER nibogd <nibogd@users.noreply.github.com>
MAINTAINER 3ch01c <3ch01c@users.noreply.github.com>

ADD . /ingress-ice/
RUN chmod +x /ingress-ice/scripts/*
RUN ln -s /ingress-ice/scripts/movie.sh /etc/cron.daily/
RUN ln -s /ingress-ice/scripts/bluest.sh /etc/cron.daily/
RUN chmod +x /ingress-ice/docker-ingress-ice.sh
RUN mkdir /screenshots
VOLUME /screenshots

CMD ["/ingress-ice/docker-ingress-ice.sh"]
