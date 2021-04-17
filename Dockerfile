FROM php:7.4-apache

COPY ./vhosts/*.conf /etc/apache2/sites-available

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
    # Install composer package manager
    && cd /opt \
    # Download and test installer
    && curl -sSL https://getcomposer.org/installer > composer-setup.php \
    && curl -sSL https://composer.github.io/installer.sha384sum > composer-setup.sha384sum \
    && sha384sum --check composer-setup.sha384sum \
    # Move Composer and add soft link
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    # Delete installer
    && rm /opt/composer-setup.php /opt/composer-setup.sha384sum \
    && a2ensite *.conf \
    && a2enmod rewrite \
    && service apache2 restart \
    && cd /var/www \
    && rm -rf html


    # Set composer ENVIRONMENT variables
    ENV PATH=$PATH:/root/composer/vendor/bin \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/root/composer



