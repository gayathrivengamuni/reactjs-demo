#!/bin/bash

# Login to Docker Hub (dev repo)
echo "$DOCKER_PASSWORD" | docker login -u "$sravanaboyanagayathri" --password-stdin

# Push the image to dev repository
docker push sravanaboyanagayathri/dev-repo:latest
