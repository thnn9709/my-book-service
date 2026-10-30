#!/bin/sh
set -e

# Đảm bảo thư mục data tồn tại
mkdir -p /opt/alist/data

# Tạo file config.json với đường dẫn tuyệt đối
cat <<EOF > /opt/alist/data/config.json
{
  "force": false,
  "site_url": "",
  "cdn": "",
  "jwt_secret": "my-alist-secret-key-render-kobo",
  "token_expires_in": 48,
  "database": {
    "type": "postgres",
    "host": "${DB_HOST}",
    "port": ${DB_PORT:-5432},
    "user": "${DB_USER:-postgres}",
    "password": "${DB_PASSWORD}",
    "name": "${DB_NAME:-postgres}",
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

# In ra log xác nhận
echo "Config file created successfully. Starting AList in debug mode..."

# Chạy với cờ --debug để in toàn bộ thông báo kết nối DB
cd /opt/alist
exec /opt/alist/alist server --no-prefix --debug
