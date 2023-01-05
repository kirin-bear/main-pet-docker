#!/usr/bin/env bash

# запускать только из корневого каталога
. "$(pwd)/bin/functions.sh"

# получим имя файла переопределяющего конфиги
DOCKER_COMPOSE_OVERRIDE=$(getDockerComposeOverride)
if [ -z "${VAR}" ]
  then docker compose -f docker-compose.yml build
  else docker compose -f docker-compose.yml -f "$DOCKER_COMPOSE_OVERRIDE" build
fi
