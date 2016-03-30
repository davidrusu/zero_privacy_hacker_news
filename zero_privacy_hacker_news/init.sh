#! /usr/bin/env bash
set -e

# Create the database
docker-compose run web ./env rake RAILS_ENV=production db:create

# Initialize the database
docker-compose run web ./env rake RAILS_ENV=production db:setup

# Update the database to the most recent one
docker-compose run web ./env rake RAILS_ENV=production db:migrate
