FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# Install apache, PHP, and supplimentary programs. curl and lynx-cur are for debugging the container.
RUN  apt-get -y install apache2 php libapache2-mod-php
RUN apt-get -y install nano net-tools systemd wget tar make
RUN apt-cache search php7
RUN touch /var/www/html/index.php
RUN echo "<?php phpinfo(); ?>" > /var/www/html/info.php
COPY 001-default.conf /etc/apache2/sites-available/000-default.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY config_porta /etc/apache2/ports.conf
COPY a2.conf /etc/apache2/apache2.conf
COPY p2.conf /etc/php/7.4/apache2/php.ini
COPY gulpfile.js /gulpfile.js

EXPOSE 8080
CMD apache2ctl -D FOREGROUND