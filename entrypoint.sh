#!/bin/sh
set -e

mkdir -p /opt/alist/data

cat <<EOF > /opt/alist/data/config.json
{
  "force": false,
  "site_url": "",
  "cdn": "",
  "jwt_secret": "my-alist-secret-key-render-kobo",
  "token_expires_in": 48,
  "database": {
    "type": "postgres",
    "host": "$DB_HOST",
    "port": $DB_PORT,
    "user": "$DB_USER",
    "password": "$DB_PASSWORD",
    "name": "$DB_NAME",
    "db_file": "",
    "table_prefix": "x_",
    "ssl_mode": "require"
  },
  "scheme": {
    "address": "0.0.0.0",
    "http_port": 5244,
    "https_port": -1,
    "force_https": false,
    "cert_file": "",
    "key_file": ""
  }
}
EOF

echo "Config generated with Host: $DB_HOST, Port: $DB_PORT, User: $DB_USER"
cd /opt/alist
exec /opt/alist/alist server --no-prefix
