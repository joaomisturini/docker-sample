FROM php:7.1-fpm

RUN apt-get update && \
    apt-get install -y libmcrypt-dev mysql-client libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev zlib1g-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mcrypt mysqli pdo_mysql iconv gd soap zip

CMD [ "docker-php-entrypoint", "php-fpm" ]
