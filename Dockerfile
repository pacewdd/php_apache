FROM php:8.1.2-apache

RUN \
    apt-get update \
    && apt install -qq -y \
      curl \
      git \
      zip unzip \
      libxml2-dev \
      libpng-dev \
      libzip-dev \
      vim \
      nano \
    && docker-php-ext-install pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && cp /bin/sh /bin/sh.bak \
    && cp /bin/bash /bin/sh \
    && a2enmod rewrite \
    && service apache2 restart




