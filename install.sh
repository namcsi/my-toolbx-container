#!/bin/bash
set -euo pipefail

CONTAINER_NAME="my-fedora-toolbox-44"
IMAGE="localhost/my-fedora-toolbox:44"

podman stop "$CONTAINER_NAME" || true
podman rm "$CONTAINER_NAME" || true

podman build --tag "$IMAGE" .

toolbox create --image "$IMAGE"
