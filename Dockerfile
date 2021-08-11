FROM php:8.0.9-apache

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
      gd \
      zip \
      dom \
    # already installed:
    #   iconv \
    #   mbstring \
    && a2enmod rewrite \
    && service apache2 restart




