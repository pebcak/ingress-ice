FROM wernight/phantomjs
MAINTAINER nibogd <nibogd@users.noreply.github.com>
MAINTAINER 3ch01c <3ch01c@users.noreply.github.com>

# Usage:
# $ docker build -t ingress-ice .
# $ docker run -v /path/to/.ingress-ice.conf:/srv/ingress-ice/.ingress-ice.conf -v /path/to/screenshots/:/srv/ingress-ice/screenshots ingress-ice

USER root
RUN echo "deb http://http.us.debian.org/debian/ testing non-free contrib main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install imagemagick mencoder -y

WORKDIR /srv/ingress-ice

COPY docker-ingress-ice.sh .
RUN chmod +x docker-ingress-ice.sh
COPY ice ice
COPY scripts scripts
RUN chmod +x scripts/*

CMD ["sh", "docker-ingress-ice.sh"]
