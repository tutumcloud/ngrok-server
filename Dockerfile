FROM ubuntu:trusty
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apt-get update && \
    apt-get install -y build-essential golang git mercurial && \
    mkdir -p /release

ENV NGROK_VERSION 1.7.1
RUN git clone https://github.com/inconshreveable/ngrok.git /ngrok
RUN cd /ngrok; git checkout -fq $NGROK_VERSION

ADD *.sh /

ENV TLS_KEY **None**
ENV TLS_CERT **None**
ENV CA_CERT **None**
ENV DOMAIN **None**
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443

VOLUME ["/ngrok/bin"]

CMD ["/run-server.sh"]
