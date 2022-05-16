include .env

docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

up: docker-up
down: docker-down
restart: down up

kirin-bear-web-pull:
	cd ${KIRIN_BEAR_WEB_PATH}
	git pull