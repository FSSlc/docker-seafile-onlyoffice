#!/bin/bash

######################################
# Publish the seafile base image to docker
# registry. This script should only be called during a travis build trigger by a tag.
######################################

# Nerver use "set -x" or it would expose the docker credentials in the travis logs!
set -e
set -o pipefail

# ref: https://docs.travis-ci.com/user/docker/#branch-based-registry-pushes
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

## Always use the base image we build manually to reduce the download size of the end user.
(
    cd image
    make push-base
)
