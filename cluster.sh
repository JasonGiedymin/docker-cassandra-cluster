#!/bin/bash
#
# Author: Jason Giedymin <jason dot giedymin -at- gmail dot com>
# License: Apache2
# Desc: Basic cluster script for cassandra using docker.
#       This is meant for local development, though you could
#       boot this up onto a docker-machine cluster. If you do
#       indeed embark on that journey pay particular attention
#       to the port specs in the compose yaml. It may be more
#       than you'd want for production. Also consider a service
#       container exposed with ports that are linked instead.
#
# If you desire logging, supply COMPOSE_LOG=true like so:
#     COMPOSE_LOG=true bash cluster.sh up
# A file named compose.log will appear.
#

COMPOSE_LOG=${COMPOSE_LOG:false}

function removeContainers() {
  docker-compose rm -fv cassandra-1
  docker-compose rm -fv cassandra-2
}

function removeData() {
  # [[ -e ./data ]] && rm -R ./data
  [[ -e ./cassandra-1 ]] && rm -R ./cassandra-1
  [[ -e ./cassandra-2 ]] && rm -R ./cassandra-2
}

function createData() {
  mkdir -p ./cassandra-1/data
  mkdir -p ./cassandra-2/data
}

function up() {
  removeContainers
  removeData

  # createData # uncomment if you desire mounts

  function logup() {
    docker-compose up > compose.log &
  }

  [[ $COMPOSE_LOG = true ]] && logup || docker-compose up
}

function remove() {
  docker-compose stop
  removeContainers
  removeData
}

case "$1" in
  up)
    up
    ;;
  halt|stop|down)
    docker-compose stop
    ;;
  remove)
    remove
    ;;
  *)
    echo "$0 {up|halt|stop|down|remove}"
    ;;
esac
