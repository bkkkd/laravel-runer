#! /bin/sh
#
# init.sh
# Copyright (C) 2020 root <root@timlocal>
#
# Distributed under terms of the MIT license.
#
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
cd /app
if [ ! -f "./composer.lock" ]; then
    composer install
else
    composer update
fi

php think migrate:run
