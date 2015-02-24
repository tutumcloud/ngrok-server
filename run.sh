#!/bin/bash
set -e

if [ "${CA_CERT}" == "**None**" ]; then
    echo "Please specify CA_CERT"
    exit 1
fi

echo -e "${CA_CERT}" > /ngrok/assets/client/tls/ngrokroot.crt

if [ ! -f /ngrok/bin/ngrokd ]; then
    echo "=> Compiling ngrok binary files"
    cd /ngrok; make release-server release-client
    echo "=> Successfully built the binaries"
fi

if [ "${TLS_KEY}" == "**None**" ]; then
    echo "Please specify TLS_KEY"
    exit 1
fi

if [ "${TLS_CERT}" == "**None**" ]; then
    echo "Please specify TLS_CERT"
    exit 1
fi

if [ "${DOMAIN}" == "**None**" ]; then
    echo "Please specify DOMAIN"
    exit 1
fi

echo -e "${TLS_KEY}" > /server.key
echo -e "${TLS_CERT}" > /server.crt

echo "=> Running ngrok server"
/ngrok/bin/ngrokd -tlsKey=/server.key -tlsCrt=/server.crt -domain="${DOMAIN}" -httpAddr=${HTTP_ADDR} -httpsAddr=${HTTPS_ADDR} -tunnelAddr=${TUNNEL_ADDR}
