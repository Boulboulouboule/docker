#!/usr/bin/env bash

# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
YELLOW="\\033[1;33m"

APP_PORT=8000
log() {
  echo -e "$YELLOW > $1 $NORMAL"
}

run() {
  log "$YELLOW Trying to run symfony application on port $APP_PORT"
  php bin/console server:run 0.0.0.0:$APP_PORT
}

secure() {
  log "$YELLOW Symfony security check"
  php bin/console security:check
}

php(){
  php bin/console $1
}

help() {
  echo "-----------------------------------------------------------------------"
  echo "                      Available commands                              -"
  echo "-----------------------------------------------------------------------"
  echo -e -n "$YELLOW"
  echo "   > help - Display this help"
  echo "   > run - Run the app by doing php bin/console server:run 0.0.0.0:8000"
  echo "   > secure - php bin/console security:check"
  echo -e -n "$NORMAL"
  echo "-----------------------------------------------------------------------"

}

$*
