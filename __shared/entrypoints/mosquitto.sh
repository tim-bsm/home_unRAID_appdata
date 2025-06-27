#!/bin/sh

# This file needs to be added as a volume to the container (app to host):
# /mosquitto.sh:/mnt/user/appdata/shared/entrypoints/mosquitto.sh

# The following needs to be added to the extra parameters:
# --env-file /mnt/user/appdata/shared/env-files/mosquitto.env --entrypoint /mosquitto.sh


# Constants
MOSQUITTO_PASSWORD_FILE=/mosquitto/config/passwd

# Set user in password file
echo $MOSQUITTO_CREDENTIALS > $MOSQUITTO_PASSWORD_FILE
chmod 0700 $MOSQUITTO_PASSWORD_FILE
chown mosquitto:mosquitto $MOSQUITTO_PASSWORD_FILE

# Start mosquitto
/docker-entrypoint.sh /usr/sbin/mosquitto -c /mosquitto/config/mosquitto-unraid-default.conf
