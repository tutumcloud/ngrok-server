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
