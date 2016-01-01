# Here are the config files for PHP and APACHE 2

## You can mount them on the vm/container config folders like that :

*docker-compose.yml :

> volumes:
    - ../config/php/php.ini:/usr/local/etc/php/conf.d/30-custom.ini
    - ../config/apache:/etc/apache2/sites-enabled
