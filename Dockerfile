FROM arm32v7/debian:jessie-slim

LABEL maintainer "leopoo <www.leopoo.com>"

ENV TZ Asiz/Shanghai

RUN mkdir -p /conf && \
    mkdir -p /data && \
    apt-get update && \
    apt-get install -y aria2 && \
    apt-get clean


ADD aria2.conf conf-default/aria2-default.conf
ADD run.sh /run.sh

RUN chmod +x /run.sh

WORKDIR /

VOLUME ["/data","/conf"]

EXPOSE 6800

ENTRYPOINT [ "/run.sh" ]