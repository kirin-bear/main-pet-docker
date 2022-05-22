include .env

docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

docker-build:
	docker compose build

up: docker-up
down: docker-down
restart: down up
build: docker-down docker-build

kirin-bear-web-pull:
	cd ${KIRIN_BEAR_WEB_PATH}
	git pull

kirin-bear-api-pull:
	cd ${KIRIN_BEAR_API_PATH}
	git pull