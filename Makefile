include .env

docker-pull:
	docker compose pull

docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

docker-build:
	docker compose build

docker-down-clear:
	docker compose down -v --remove-orphans

docker-clear:
	docker system prune -af

up: docker-up
down: docker-down
restart: down up
build: docker-down docker-build
init: docker-down-clear docker-pull docker-build docker-up

deploy-kb-web-tag:
	cd ${KIRIN_BEAR_WEB_PATH} && git fetch --tags && get checkout v$(tag)
	make down
	docker compose build kirin-bear-web
	make up
	make docker-clear

deploy-kb-api-tag:
	cd ${KIRIN_BEAR_API_PATH} && git fetch --tags && get checkout v$(tag)
	docker compose build kirin-bear-api
	make up
	make docker-clear
