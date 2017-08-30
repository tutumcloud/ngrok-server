#!/bin/bash
set -e

if [ "${DOMAIN}" == "**None**" ]; then
    export DOMAIN=${HOSTNAME}
fi

/build.sh

if [ "${TLS_KEY}" == "**None**" ]; then
    echo "Please specify TLS_KEY"
    exit 1
fi

if [ "${TLS_CERT}" == "**None**" ]; then
    echo "Please specify TLS_CERT"
    exit 1
fi

echo "Using DOMAIN: ${DOMAIN}"

echo -e "${TLS_KEY}" > /server.key
echo -e "${TLS_CERT}" > /server.crt

exec /ngrok/bin/ngrokd -tlsKey=/server.key -tlsCrt=/server.crt -domain="${DOMAIN}" -httpAddr=${HTTP_ADDR} -httpsAddr=${HTTPS_ADDR} -tunnelAddr=${TUNNEL_ADDR} -log=${LOG} -log-level=${LOG_LEVEL}
