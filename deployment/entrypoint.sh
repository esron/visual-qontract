#!/bin/sh
set -e

# Template nginx configuration with environment variables
# Write to /tmp since user 1001 doesn't have write access to /etc/nginx
envsubst '${GRAPHQL_URI} ${AUTHORIZATION}' < /etc/nginx/nginx.conf > /tmp/nginx.conf

# Start nginx with custom config location
exec nginx -c /tmp/nginx.conf -g "daemon off;"
