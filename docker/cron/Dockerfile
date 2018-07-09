FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y mysql-client libfreetype6-dev libjpeg62-turbo-dev libpng-dev libxml2-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mysqli pdo_mysql iconv gd soap zip

COPY ./docker/cron/start.sh /usr/local/bin/start

CMD [ "/usr/local/bin/start" ]
