FROM php:7.2-fpm

LABEL maintainer="João Pedro Benedetti Misturini <joao.benedetti.misturini@gmail.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends mysql-client libfreetype6-dev libpng-dev && \
    apt-get install -y --no-install-recommends libjpeg62-turbo-dev libxml2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j"$(nproc)" mysqli pdo_mysql iconv gd soap zip

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

CMD [ "docker-php-entrypoint", "php-fpm" ]
