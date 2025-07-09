#!/bin/bash

# Install Docker using snap
snap install docker

# Pull the latest Kasm image from linuxserver
docker pull lscr.io/linuxserver/kasm:latest

# Run the Kasm container with the specified options
docker run -d \
  --name=kasm \
  --privileged \
  --security-opt apparmor=rootlesskit \ # optional, remove if not needed
  -e KASM_PORT=443 \
  -e DOCKER_HUB_USERNAME=USER \ # optional, replace USER if needed
  -e DOCKER_HUB_PASSWORD=PASS \ # optional, replace PASS if needed
  -e DOCKER_MTU=1500 \ # optional
  -p 3000:3000 \
  -p 443:443 \
  -v /path/to/kasm/data:/opt \
  -v /path/to/kasm/profiles:/profiles \ # optional
  -v /dev/input:/dev/input \ # optional
  -v /run/udev/data:/run/udev/data \ # optional
  --restart unless-stopped \
  lscr.io/linuxserver/kasm:latest
