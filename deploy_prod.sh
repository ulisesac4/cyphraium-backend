#!/usr/bin/env bash
# exit on error
set -o errexit

# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite

# Remove old files

sudo rm -rf /var/apps/cyphraium/*

# Copy to deploy to place
sudo cp -rf _build/prod/* /var/apps/cyphraium





# Copy env vars to palce
#sudo cp cyphraium.env /etc/default/

# Copy service to place
sudo cp cyphraium.service /etc/systemd/system/
sudo chown -R cyphraium:cyphraium /var/apps/cyphraium
sudo systemctl daemon-reload

# Perform any migrations necessary
_build/prod/rel/api/bin/api eval "Api.Release.migrate"

# Let binary to bind port 80

sudo setcap "cap_net_bind_service=+ep" /var/apps/cyphraium/rel/api/erts-11.0.3/bin/beam.smp