FROM php:7.4-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./your-script.php" ]

RUN docker-php-ext-enable sodium

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["php", "-a"]