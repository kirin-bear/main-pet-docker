# Установка и обновление SSL-сертификата

Основная инструкция - https://fornex.com/ru/help/ssl-lets-encrypt-wildcard-hestia-cp/

Сделаем по дефолту

```bash
letsencrypt - bash acme.sh --set-default-ca --server letsencrypt
```

1. **Выполнить первый скрипт**

    ```bash
    acme.sh --issue -d kirin-bear.ru -d *.kirin-bear.ru --dns --force --yes-I-know-dns-manual-mode-enough-go-ahead-please
    ```

2. **Скрипт сгенерирует 2 TXT записи которые нужно добавить в DNS записи**
3. **После обновления DNS возобновляем выдачу сертификата**

    ```bash
    bash acme.sh --renew -d kirin-bear.ru -d *.kirin-bear.ru --dns --force --yes-I-know-dns-manual-mode-enough-go-ahead-please
    ```


**4. Перезапустить nginx**

**ПРО ОБНОВЛЕНИЕ СЕРТИФИКАТА:**

**Чтобы обновить сертификаты, вам нужно выполнить этот же порядок через 90 дней.**

**Переходим в папку [acme.sh](http://acme.sh/) от корневой папки пользователя и выполняем [1], [2], [3], [4]**

Автоматическое обновление let’s encrypt certs с помощью задания Cron, добавьте этот ежедневный cron для проверки автообновления:

0 0 * * * "/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" > /dev/null
