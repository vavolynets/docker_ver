#!/bin/sh
DOMAIN="lab"
BIMAGE="${DOMAIN}/pybase"
IMAGE="${DOMAIN}/${1:-"docker_ver"}"
TAG=${2:-"1.0"}
Docker_GID=$(awk 'BEGIN {cmd="getent group docker"
                         cmd | getline cmd_out
                         split(cmd_out,gid,":")
                         print gid[3]}')
shift; shift
echo "Building images, tag is ${IMAGE}:${TAG}"
docker build -t "${BIMAGE}:${TAG}"  pybase && \
docker build -t "${IMAGE}:${TAG}" \
             --build-arg "Img=${BIMAGE}:${TAG}" \
             --build-arg "Docker_GID=${Docker_GID}" \
             --cache-from "{BIMAGE}:${TAG}" flask_app
