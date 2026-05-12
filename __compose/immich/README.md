# immich
Immich is a container-based software to easily manage and view all your photos


## Initial start
When uploading all your files for the first time to immich, a lot of processing power is needed for all the machine learning functionality. For that, it can be useful to temporarily use another computer with a much better graphics card (e.g. a gaming pc).  
To do so, copy the [`.env`](./.env) file and the [`hwaccel.ml.yaml`](./hwaccel.ml.yaml) file to that machine. Only take the machine learning service in the [`compose.yaml`](./compose.yaml) and add the exposing of the port to it &mdash; see the example below for a NVIDIA card. After the container is up and running, add the IP/Hostname of the machine it is running on, followed by the port `3003` to the URLs for machine learning under the `System Settings` on the immich GUI. Make sure, that the URL of the better machine is first as immich will chose the first responding container.  
_See the [ML docs](https://docs.immich.app/features/ml-hardware-acceleration/) for further information._

```yaml
name: immich-stack

services:
  immich-machine-learning:
    container_name: immich-machine-learning
    # For hardware acceleration, add one of -[armnn, cuda, rocm, openvino, rknn] to the image tag.
    # Example tag: ${IMMICH_VERSION:-release}-cuda
    image: ghcr.io/immich-app/immich-machine-learning:${IMMICH_VERSION:-release}-cuda
    extends: # uncomment this section for hardware acceleration - see https://docs.immich.app/features/ml-hardware-acceleration
      file: hwaccel.ml.yaml
      service: cuda # set to one of [armnn, cuda, rocm, openvino, openvino-wsl, rknn] for accelerated inference - use the `-wsl` version for WSL2 where applicable
    volumes:
      - model-cache:/cache
    ports:
      - 3003:3003
    env_file:
      - .env
    restart: unless-stopped
    healthcheck:
      disable: false
```

For the initial upload of photos, use the code in the following [CLI section](#cli) of this README.  


## CLI
To connect to the immich server and upload local files for example, the immich-cli can be used. As the underlying system is an unRAID install, the immich-cli docker container will be used.  
To setup the `npm` package or the container, see the [official docs](https://docs.immich.app/features/command-line-interface/) or [this reddit post](https://www.reddit.com/r/immich/comments/1ih496q/immich_cli_on_docker_guide) for the docker container in particular. 

The following command is used to upload the directory in which the command gets executed. To check the execution of the command without anything really happening/executing, add `--dry-run` behind `output` in the last line.

```bash
sudo docker run -it --rm \
--name immich-cli \ 
-v "$(pwd)":/import:ro \
-e IMMICH\_INSTANCE\_URL=http://immich:2283/api \
-e IMMICH\_API\_KEY=YOUR\_API\_KEY \
--network immich-net \
ghcr.io/immich-app/immich-cli:latest \
upload --recursive --concurrency 20 /import
```
