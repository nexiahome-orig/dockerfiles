FROM nexia/ubuntu
MAINTAINER jgeiger@gmail.com

ENV INFLUXDB_VERSION=influxdb_1.1.0
ENV INFLUXDB_FILE=${INFLUXDB_VERSION}_amd64.deb

EXPOSE 8088 8091 8083 8086

USER root

WORKDIR /tmp

RUN wget --quiet https://dl.influxdata.com/influxdb/releases/${INFLUXDB_FILE} \
      && apt-get -qq -y update \
      && dpkg -i ${INFLUXDB_FILE} \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/lib/influxdb

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "influxd" ]
