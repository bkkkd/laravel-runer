composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
cd /app
if [ ! -f "./composer.lock" ]; then
    composer install
else
    composer update
fi

php think migrate:run

/usr/bin/supervisord -c /app/docker/supervisord.conf
