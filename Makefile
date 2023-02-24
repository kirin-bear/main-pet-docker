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

deploy-kirin-bear-web:
	cd ${KIRIN_BEAR_WEB_PATH} && git pull
	make down
	docker compose build kirin-bear-web
	make up

deploy-kirin-bear-api:
	cd ${KIRIN_BEAR_API_PATH} && git pull
	make down
	docker compose build kirin-bear-web
	make up