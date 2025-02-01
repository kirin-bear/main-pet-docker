# Документация

- [Установка и обновление SSL-сертификата](docs%2Fssl-lets-encrypt-wildcard.md)

## Конфигурация NGINX

1. Все запросы на сервер (хост-машину) поступают на основной nginx.
2. Далее основной nginx распределяет запросы между проектами (docker compose)

Пример конфига основного nginx
```nginx configuration
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://192.168.100.100; # IP-адрес контейнера Docker
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## Конфигурация Docker

Контейнеру с nginx выдается статический IP, чтобы можно было достучаться из nginx на хосте

```yaml
version: "3.9"

services:
  nginx:
    image: nginx:latest
    container_name: nginx_container
    networks:
      custom_network:
        ipv4_address: 192.168.100.100
    volumes:
      - ./nginx_container.conf:/etc/nginx/conf.d/default.conf
    ports:
      - "8080:80" # Опционально: открываем порт для тестов с хоста

networks:
  custom_network:
    driver: bridge
    ipam:
      config:
        - subnet: 192.168.100.0/24
```
