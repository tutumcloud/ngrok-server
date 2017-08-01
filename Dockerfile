FROM golang:1.8.3-alpine3.6
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apk update && \
    apk add git mercurial bash build-base && \
    mkdir -p /release && \
    git clone https://github.com/tutumcloud/ngrok.git /ngrok

ADD *.sh /

ENV TLS_KEY=**None** \
    TLS_CERT=**None** \
    CA_CERT=**None** \
    DOMAIN=**None** \
    TUNNEL_ADDR=:4443 \
    HTTP_ADDR=:80 \
    HTTPS_ADDR=:443

VOLUME ["/ngrok/bin"]

CMD ["/run-server.sh"]
