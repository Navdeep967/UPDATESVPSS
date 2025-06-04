#!/bin/bash

# Generate a random 10-character password
PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 10)

# Print it to the container log
echo "=========================================="
echo "🔒 Gotty Web Terminal Password: $PASSWORD"
echo "=========================================="

# Start Gotty (in foreground — this keeps the container alive)
exec /usr/local/bin/gotty --permit-write --reconnect --credential "admin:$PASSWORD" /bin/bash
