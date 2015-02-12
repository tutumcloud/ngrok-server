FROM ubuntu:trusty
MAINTAINER Feng Honglin <tifayuki@gmail.com>

RUN apt-get update && \
    apt-get install -y build-essential golang git mercurial && \
    mkdir -p /release

RUN git clone https://github.com/inconshreveable/ngrok.git ngrok

ADD run.sh /run.sh
ADD deploy_binary.sh /deploy_binary.sh
RUN chmod +x /*.sh

ENV TLS_KEY **None**
ENV TLS_CERT **None**
ENV CA_CERT **None**
ENV DOMAIN **None**
ENV TUNNEL_ADDR :4443
ENV HTTP_ADDR :80
ENV HTTPS_ADDR :443


CMD ["/run.sh"]
