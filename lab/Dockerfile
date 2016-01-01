# Dockerfile containing PHP7 + APACHE + COMPOSER + GIT + XDEBUG

FROM php:7-apache

MAINTAINER Boulboulouboule <boulboulouboule@gmail.com

#Install git, xdebug and php extensions
RUN apt-get update && apt-get install -y zlib1g-dev git libicu-dev\
    && pecl install xdebug-2.4.0RC3\
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pdo pdo_mysql

# Set up composer variables
ENV COMPOSER_BINARY=/usr/local/bin/composer \
    COMPOSER_HOME=/usr/local/composer
ENV PATH $PATH:$COMPOSER_HOME

# Install composer system-wide
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar $COMPOSER_BINARY && \
    chmod +x $COMPOSER_BINARY

# Set up global composer path
RUN mkdir $COMPOSER_HOME && chmod a+rw $COMPOSER_HOME
