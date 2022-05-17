FROM php:8.1.6-zts-alpine3.15
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN apk add --update curl \
    wget

RUN wget -P /etc/ssl/certs/ http://curl.haxx.se/ca/cacert.pem && chmod 744 /etc/ssl/certs/cacert.pem \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/bin/composer

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions curl

RUN rm /usr/local/bin/install-php-extensions \
    && apk del wget \
    && mkdir /usr/appl

COPY ./app/productup-challenge-xml-data-importer /usr/appl
WORKDIR  /usr/appl
RUN composer install && composer dumpautoload -o

RUN chmod +x /usr/appl/run

CMD ["php" "/usr/appl/run"]