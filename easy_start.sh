#!/bin/bash

## Create a New Directory for the volume mount
mkdir -p ./data && chmod 644 ./data

## Pull the docker image for the ubuntu iso image get
docker run -it  -v $PWD:/data2 goody80/busybox_ubuntu_iso:16.04.4 /bin/sh -c 'mv  /data/* /data2/data/'


## Docker run for Nested KVM in container
docker run \
    --privileged \
    -v /dev:/dev \
    -v ${PWD}:/data \
    -e RAM=2048 \
    -e SMP=1 \
    -e IMAGE=/data/ubuntu-16.04.4-server-amd64.iso \
    -e VNC=tcp \
    -p 2222:22 \
    -p 8080:80 \
    -p 5900:5900 \
    ennweb/kvm

#    -v ${PWD}:/data \
#    -e ISO_DOWNLOAD=1 \
#    -e ISO=http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-amd64.iso \
#    -e ISO=/data/disk-image/ubuntu-16.04.4-server-amd64.iso \
#    -e ISO=http://192.168.10.21:5000/ubuntu-16.04.4-server-amd64.iso \
#    -e ISO=http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-amd64.iso \
#    -e ISO2=http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-amd64.iso \
