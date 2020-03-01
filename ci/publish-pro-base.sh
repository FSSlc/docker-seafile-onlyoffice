#!/bin/bash

######################################
# Publish the seafile pro-base image to docker
# registry. This script should only be called during a travis build trigger by a tag.
######################################

# Nerver use "set -x" or it would expose the docker credentials in the travis logs!
set -e
set -o pipefail

# refer: https://docs.travis-ci.com/user/docker/#branch-based-registry-pushes
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

(
    cd image
    make push-pro-base
)
