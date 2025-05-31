#!/bin/bash

#login into DockerHub:
#docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d -it --name react -p 80:80 react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd halli098/neofinity
docker push halli098/neofinity

