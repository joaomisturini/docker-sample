FROM php:7.1-fpm

RUN apt-get update && \
    apt-get install -y git libmcrypt-dev mysql-client libfreetype6-dev libjpeg62-turbo-dev libpng-dev zlib1g-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mcrypt mysqli pdo_mysql iconv gd zip

COPY . /var/www

RUN chown -R www-data:www-data \
    /var/www/storage \
    /var/www/bootstrap/cache

RUN chmod -R 777 /var/www/storage && \
    chmod -R 777 /var/www/bootstrap/cache

WORKDIR /var/www

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    php composer.phar install -o -n --no-dev && \
    rm composer.phar

RUN apt-get remove -y git

ENTRYPOINT php artisan config:cache && \
    php artisan route:cache && \
    docker-php-entrypoint php-fpm
