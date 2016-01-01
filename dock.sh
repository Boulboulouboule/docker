#!/usr/bin/env bash

# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
YELLOW="\\033[1;33m"

# Names to identify images and containers of this app
IMAGE_NAME='php:7-apache'
CONTAINER_NAME="symfony_web_1"

# Usefull to run commands as non-root user inside containers

log() {
  echo -e "$YELLOW > $1 $NORMAL"
}

error() {
  echo ""
  echo -e "$RED >>> ERROR - $1$NORMAL"
}

build() {
  docker build -t $IMAGE_NAME .

  [ $? != 0 ] && error "Docker image build failed !" && exit 100
}

npm() {
  log "NPM install"
  docker run -it --rm -v $(pwd):/app $IMAGE_NAME \
    bash -ci "$EXECUTE_AS npm install"

  [ $? != 0 ] && error "Npm install failed !" && exit 101
}

bower() {
  log "Bower install"
  docker run -it --rm -v $(pwd):/app -v /var/tmp/bower:$HOMEDIR/.bower $IMAGE_NAME \
    /bin/bash -ci "$EXECUTE_AS bower install \
      --config.interactive=false \
      --config.storage.cache=$HOMEDIR/.bower/cache"

  [ $? != 0 ] && error "Bower install failed !" && exit 102
}

grunt() {
  log "Grunt build"
  docker run -it --rm -v $(pwd):/app $IMAGE_NAME \
    /bin/bash -ci "$EXECUTE_AS grunt"

  [ $? != 0 ] && error "Grunt build failed !" && exit 104
}

install() {
  echo "Installing full application at once"
  remove
  npm
  bower
  grunt
}

bash() {
  log "BASH into $CONTAINER_NAME"
  docker exec -ti $CONTAINER_NAME bash
}

stop() {
  docker stop $CONTAINER_NAME
}

start() {
  docker start $CONTAINER_NAME
}

remove() {
  log "Removing previous container $CONTAINER_NAME" && \
      docker rm -f $CONTAINER_NAME &> /dev/null || true
}

help() {
  echo "-----------------------------------------------------------------------"
  echo "                      Available commands                              -"
  echo "-----------------------------------------------------------------------"
  echo -e -n "$YELLOW"
  echo "   > build - To build the Docker image"
  echo "   > npm - To install NPM modules/deps"
  echo "   > bower - To install Bower/Js deps"
  echo "   > grunt - To run grunt task"
  echo "   > install - To execute full install at once"
  echo "   > stop - To stop main jekyll container"
  echo "   > start - To start main jekyll container"
  echo "   > bash - Log you into container"
  echo "   > remove - Remove main jekyll container"
  echo "   > help - Display this help"
  echo -e -n "$NORMAL"
  echo "-----------------------------------------------------------------------"

}

$*
