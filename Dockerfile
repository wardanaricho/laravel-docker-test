FROM php:8.3-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    git curl zip unzip libonig-dev libxml2-dev libzip-dev libcurl4-openssl-dev libssl-dev libpq-dev \
    && docker-php-ext-install \
    pdo_mysql \
    mbstring \
    zip \
    dom \
    fileinfo \
    pcntl \
    xml \
    ctype \
    bcmath \
    opcache

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY src/ ./

RUN composer install --no-interaction --prefer-dist --optimize-autoloader

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]