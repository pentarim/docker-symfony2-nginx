#!/bin/bash
cd /var/www

composer install
rm -rf app/cache/*
php app/console c:c --env=prod --no-debug
php app/console c:w
php app/console assets:install --symlink web/
php app/console assetic:dump web/
chown -R www-data:www-data app/cache
chown -R www-data:www-data app/logs
chmod 777 app/cache
chmod 777 app/logs

service php5-fpm start
nginx
