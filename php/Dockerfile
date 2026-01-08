FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    git \
    unzip \
    ca-certificates \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y \
    php8.1 \
    php8.1-cli \
    php8.1-pgsql \
    php8.1-curl \
    php8.1-mbstring \
    php8.1-xml \
    php8.1-zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html

COPY php/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
