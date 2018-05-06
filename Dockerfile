FROM alpine:3.7

LABEL maintainer "leopoo <www.leopoo.com>"

ENV  TIME_ZONE Asiz/Shanghai

RUN mkdir -p /conf && \
    mkdir -p /data && \
    apk add --no-cache tzdata bash aria2 s6

ADD aria2.conf conf-default/aria2-default.conf
ADD run.sh /run.sh

RUN chmod +x /run.sh

WORKDIR /

VOLUME ["/data","/conf"]

EXPOSE 6800

ENTRYPOINT [ "/run.sh" ]