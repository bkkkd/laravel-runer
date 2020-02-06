composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
if [ ! -f "./composer.lock" ]; then
    composer install
else
    composer update
fi

php artisan migrate
php artisan serve --host=0.0.0.0
