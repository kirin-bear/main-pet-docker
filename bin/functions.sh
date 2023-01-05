#!/usr/bin/env bash

function getDockerComposeOverride {
    DOCKER_COMPOSE_OVERRIDE="docker-compose.override.yml"
    # если существует файл для переопределения некоторых параметров, запускаем его
    if [ -e "$(pwd)/DOCKER_COMPOSE_OVERRIDE" ]
    then echo "$DOCKER_COMPOSE_OVERRIDE"
    else echo ""
    fi
}