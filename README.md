# [unRAID](https://unraid.net/) Docker configuration

This repository is used to share my unRAID Docker configurations. Of course, these configurations are not limited to unRAID but rather can be adapted for a normal Docker use, as well. It includes the configurations for my smart home build around [Home Assistant](https://www.home-assistant.io) in combination with [Frigate](https://frigate.video), [Mosquitto](https://mosquitto.org) and [Traefik](https://traefik.io/traefik). 


## Examples

### Desktop-View
The following two examples show the [Home Assistant](/hass/) configuration in dark and light mode. It exists of multiple buttons, graphics and pop-ups.
![Desktop-View in dark mode with opened pop-up](/.assets/dashboard-desktop-popup.png)
![Desktop-View in light mode](/.assets/dashboard-desktop.png)

### Mobile-View
The following example shows the mobile view which automatically shows less information that aren't necessarily needed on smaller devices. You can still rotate your phone to get the full information on the widescreen, though.
![Mobile-View in light mode](/.assets/dashboard-mobile.png)


## Folder structure

### Folders containing only letters
Feel free to check out all the folders corresponding to the specific docker container. You can also use the following list to navigate there quickly.

- [Frigate](/frigate/)
- [Home Assistant](/hass/)
- [MQTT with Mosquitto](/mosquitto/)
- [Reverse-Proxy through Traefik](/traefik/)

### Special folders
If a folder contains two underscores, it is somehow special or contains further information.

The first one, [`__run-parameters`](/__run-parameters/), contains the parameters that [unRAID](https://unraid.net/) uses to start a docker container. These are the normal parameters that one has to add to the [`docker run`-command](https://docs.docker.com/reference/cli/docker/container/run/) upon starting or creating a new docker container. Thus, the files can be used by anybody — regardless of whether [unRAID](https://unraid.net/) is used or not — to pick out all the parameters used.

The second folder is the [`__shared`](/__shared/) one which contains all the files that are either shared across multiple containers — like the [certificates](/__shared/certs/) — or used to give extra parameters to some containers — like [additional labels](/__shared/label-files/).
