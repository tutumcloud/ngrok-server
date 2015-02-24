#!/bin/bash
set -e

/build.sh

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

exec /ngrok/bin/ngrokd -tlsKey=/server.key -tlsCrt=/server.crt -domain="${DOMAIN}" -httpAddr=${HTTP_ADDR} -httpsAddr=${HTTPS_ADDR} -tunnelAddr=${TUNNEL_ADDR}
