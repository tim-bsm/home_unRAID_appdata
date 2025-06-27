#!/bin/sh

# This file needs to be added as a volume to the container (app to host):
# /hass.sh:/mnt/user/appdata/shared/entrypoints/hass.sh

# The following needs to be added to the extra parameters:
# --env-file /mnt/user/appdata/shared/env-files/hass.env --label-file /mnt/user/appdata/shared/label-files/hass --entrypoint /hass.sh


# Install samba to shutdown PCs remotely with 'net rpc shutdown'
# https://github.com/homebridge/docker-homebridge/issues/78#issuecomment-370945450
apk update && apk add --no-cache samba samba-common-tools

# Start hass
python -m homeassistant --config /config
