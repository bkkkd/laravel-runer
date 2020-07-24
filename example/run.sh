composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
if [ ! -f "./composer.lock" ]; then
    composer install
else
    composer update
fi

if [ ! -f "./.env" ]; then
    php artisan key:generate
fi
php artisan migrate
/usr/bin/supervisord -c /myapp/docker/supervisor/supervisord.conf
