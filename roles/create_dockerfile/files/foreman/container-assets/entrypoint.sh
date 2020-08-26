#!/bin/bash

set -x

/usr/bin/wait_on_postgres.py

foreman-rake db:migrate

SEED_ADMIN_PASSWORD=$SEED_ADMIN_PASSWORD foreman-rake db:seed

exec "$@"
