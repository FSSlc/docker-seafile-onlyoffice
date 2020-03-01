#!/bin/bash

######################################
# Publish the seafile pro-base image to docker
# registry. This script should only be called during a travis build trigger by a tag.
######################################

# Nerver use "set -x" or it would expose the docker credentials in the travis logs!
set -e
set -o pipefail

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

(
    cd image
    make push-pro-base
)
