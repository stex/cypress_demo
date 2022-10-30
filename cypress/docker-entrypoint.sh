#!/usr/bin/env bash
set -e

echo "Waiting for backend at http://${BASE_URL}..."
npx wait-on -t 120000 "http-get://${BASE_URL}"
exec "$@"
