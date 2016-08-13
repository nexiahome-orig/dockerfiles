FROM nexia/ubuntu
MAINTAINER jgeiger@gmail.com

ENV TELEGRAF_VERSION=telegraf_0.13.2
ENV TELEGRAF_FILE=${TELEGRAF_VERSION}_amd64.deb

USER root

WORKDIR /tmp

RUN wget --quiet https://dl.influxdata.com/telegraf/releases/${TELEGRAF_FILE} \
      && apt-get -qq -y update \
      && dpkg -i ${TELEGRAF_FILE} \
      && apt-get autoremove \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR $HOME

ENTRYPOINT [ "tini", "--", "/entrypoint.sh"]

CMD [ "telegraf" ]
