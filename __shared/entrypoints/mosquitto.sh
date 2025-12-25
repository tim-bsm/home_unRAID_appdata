#!/bin/sh

# This file needs to be added as a volume to the container (app to host):
# /mosquitto.sh:/mnt/user/appdata/shared/entrypoints/mosquitto.sh

# The following needs to be added to the extra parameters:
# --env-file /mnt/user/appdata/shared/env-files/mosquitto.env --entrypoint /mosquitto.sh


# Constants
MOSQUITTO_PASSWORD_FILE=/mosquitto/config/passwd

# Functions
parse_env_to_file() {
    # Convert comma-separated credentials to newline-separated format
    echo "$MOSQUITTO_CREDENTIALS" | tr ',' '\n' > "$MOSQUITTO_PASSWORD_FILE"
}

# Set user in password file and update to hashed passwords
parse_env_to_file
mosquitto_passwd -U $MOSQUITTO_PASSWORD_FILE

# Set permissions
chmod 0700 $MOSQUITTO_PASSWORD_FILE
chown mosquitto:mosquitto $MOSQUITTO_PASSWORD_FILE

# Start mosquitto
/docker-entrypoint.sh /usr/sbin/mosquitto -c /mosquitto/config/mosquitto-unraid-default.conf
