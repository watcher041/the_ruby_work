#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# db configure command
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop
rails db:create
rails db:migrate:reset
rails db:seed

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
