#!/usr/bin/env bash

# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
YELLOW="\\033[1;33m"

# Names to identify container of this app
CONTAINER_NAME="symfony_web_1"

log() {
  echo -e "$YELLOW > $1 $NORMAL"
}

bash() {
  if [[ $1 ]]; then
    log "BASH into $1"
    docker exec -ti $1 bash
  else
    log "BASH into $CONTAINER_NAME"
    docker exec -ti $CONTAINER_NAME bash
  fi
}

stop() {
  docker stop $CONTAINER_NAME
}

start() {
  docker start $CONTAINER_NAME
}

remove() {
  log "Removing $CONTAINER_NAME"
      docker rm -f $CONTAINER_NAME
}

rmall(){
  log "Removing all containers"
  docker stop $(docker ps -aq)
  docker rm $(docker ps -aq)
}

rmexited()
{
  log "Removing all exited containers"
  docker rm -v $(docker ps -a -q -f status=exited)
}

help() {
  echo "-----------------------------------------------------------------------"
  echo "                      Available commands                              -"
  echo "-----------------------------------------------------------------------"
  echo -e -n "$YELLOW"
  echo "   > build    - To build the Docker image"
  echo "   > stop     - To stop container"
  echo "   > start    - To start a stopped container"
  echo "   > bash     - Log you into container"
  echo "   > remove   - Remove the container"
  echo "   > rmall    - Remove all containers"
  echo "   > rmexited - Remove the exited containers"
  echo "   > help     - Display this help"
  echo -e -n "$NORMAL"
  echo "-----------------------------------------------------------------------"

}

$*
