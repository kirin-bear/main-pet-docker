# Документация

### Установка SSL сертификата для доменов на REG.RU
1. Установить либу `https://pypi.org/project/certbot-regru/`
2. Выполнить команду
```
sudo certonly --manual -d *.$DOMAIN -d $DOMAIN --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email --rsa-key-size 4096
```
4. В результате сгенерируется строка, которую нужно вставить в DNS-записи TXT
```
Please deploy a DNS TXT record under the name
_acme-challenge.$DOMAIN with the following value:

ugwkExWje_5w0y-YClKH2R2AyR6acp01zkOzpiDN7Us

Before continuing, verify the record is deployed.
```
5. Подготовить regru.штш

### Полезные ссылки:
- [Библиотека для генерации Wildcart-сертификата, если домен на reg.ru](https://github.com/free2er/certbot-regru)