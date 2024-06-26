FROM php:7-fpm-buster

RUN apt update -y
RUN apt install nginx supervisor -y
RUN mkdir -p /var/log/php-fpm/

COPY default /etc/nginx/sites-enabled/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY index.php /var/www/html/index.php

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

CMD [ "/usr/bin/supervisord" ]
