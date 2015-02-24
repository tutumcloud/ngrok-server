#!/bin/bash
set -e

/build.sh

cat > /root/.ngrok <<EOF
server_addr: ${TUNNEL_ADDR}
EOF

exec /ngrok/bin/ngrok "$@"
