#!/bin/bash

# Check the Git branch
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
     ./build.sh

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sravanaboyanagayathri -p $DOCKER_PASSWORD

  
    # Tag the image
    docker tag react-appimg sravanaboyanagayathri/dev 
  

    # Push the image to the Dev Docker Hub repository
    docker push sravanaboyanagayathri/dev
  elif [[ $GIT_BRANCH == "origin/master" ]]; then
        docker build -t react-appimg .

    # Log in to Docker Hub (replace with your actual Docker Hub credentials)
    docker login -u sravanaboyanagayathri -p $DOCKER_PASSWORD

  
    # Tag the image
    docker tag react-appimg sravanaboyanagayathri/prod
  

    # Push the image to the Dev Docker Hub repository
    docker push sravanaboyanagayathri/prod
else
    echo "Deployment error"
fi

