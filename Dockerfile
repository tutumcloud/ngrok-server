FROM golang:1.8.3
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apt-get update && \
    apt-get install git mercurial bash build-essential -y && \
    mkdir -p /release && \
    git clone https://github.com/tutumcloud/ngrok.git /ngrok

ADD *.sh /

ENV TLS_KEY=**None** \
    TLS_CERT=**None** \
    CA_CERT=**None** \
    DOMAIN=**None** \
    TUNNEL_ADDR=:4443 \
    HTTP_ADDR=:80 \
    HTTPS_ADDR=:443 \
    LOG=stdout \
    LOG_LEVEL=INFO

VOLUME ["/ngrok/bin"]

CMD ["/run-server.sh"]
