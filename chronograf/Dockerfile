FROM nexia/ubuntu
MAINTAINER jgeiger@gmail.com

ARG CHRONOGRAF_VERSION=chronograf_1.0.0
ARG CHRONOGRAF_FILE=${CHRONOGRAF_VERSION}_amd64.deb

EXPOSE 10000

USER root

WORKDIR /tmp

RUN wget --quiet https://dl.influxdata.com/chronograf/releases/${CHRONOGRAF_FILE} \
      && apt-get -qq -y update \
      && dpkg -i ${CHRONOGRAF_FILE} \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /opt/chronograf

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "/opt/chronograf/chronograf" ]
