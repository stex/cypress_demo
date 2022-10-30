#!/usr/bin/env bash
set +e

# This is a workaround to be able to run a custom command in github actions
# when we spin up a backend for cypress tests...
# I wish there was a way to set the service command like in gitlab CI.
[[ -n "$CYPRESS" ]] && bundle exec rake db:setup

exec "$@"
