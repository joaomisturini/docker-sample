#!/bin/bash

chmod -R 777 storage/*
chmod -R 777 bootstrap/cache/*

docker-php-entrypoint php-fpm
