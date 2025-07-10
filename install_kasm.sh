#!/bin/bash

# Install Docker using snap
sudo snap install docker

# Start Docker
sudo snap start docker


# Pull the latest Kasm image from linuxserver
sudo docker pull lscr.io/linuxserver/kasm:latest

# Run the Kasm container with the specified options
sudo docker run -d \
  --name=kasm \
  --privileged \
  --security-opt apparmor=rootlesskit \
  -e KASM_PORT=443 \
  -e DOCKER_HUB_USERNAME=USER \
  -e DOCKER_HUB_PASSWORD=PASS \
  -e DOCKER_MTU=1500 \
  -p 3000:3000 \
  -p 443:443 \
  -v /path/to/kasm/data:/opt \
  -v /path/to/kasm/profiles:/profiles \
  -v /dev/input:/dev/input \
  -v /run/udev/data:/run/udev/data \
  --restart unless-stopped \
  lscr.io/linuxserver/kasm:latest

