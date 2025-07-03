#!/bin/sh

# Permission folder Laravel
chown -R www-data:www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache

# Jalankan php-fpm
exec php-fpm