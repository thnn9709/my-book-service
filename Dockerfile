FROM xhofe/alist:latest

EXPOSE 5244

CMD ["sh", "-c", "cat <<EOF > /opt/alist/data/config.json\n{\n  \"force\": false,\n  \"site_url\": \"\",\n  \"cdn\": \"\",\n  \"jwt_secret\": \"$(head -c 16 /dev/urandom | md5sum | head -c 32)\",\n  \"token_expires_in\": 48,\n  \"database\": {\n    \"type\": \"$DB_TYPE\",\n    \"host\": \"$DB_HOST\",\n    \"port\": $DB_PORT,\n    \"user\": \"$DB_USER\",\n    \"password\": \"$DB_PASSWORD\",\n    \"name\": \"$DB_NAME\",\n    \"db_file\": \"\",\n    \"table_prefix\": \"x_\",\n    \"ssl_mode\": \"$DB_SSL_MODE\"\n  },\n  \"scheme\": {\n    \"address\": \"0.0.0.0\",\n    \"http_port\": 5244,\n    \"https_port\": -1,\n    \"force_https\": false,\n    \"cert_file\": \"\",\n    \"key_file\": \"\"\n  }\n}\nEOF\nexec /opt/alist/alist server --no-prefix"]
