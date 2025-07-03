#!/bin/sh

# Set permission
chown -R www-data:www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache

# Generate app key jika belum ada
if [ ! -f .env ]; then
  cp .env.example .env
fi

php artisan key:generate

# Jalankan migrasi database (jika sudah ada koneksi DB)
php artisan migrate --force

# Jalankan php-fpm
exec php-fpm
