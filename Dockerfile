# syntax=docker/dockerfile:1

FROM php:8.3.11-apache
RUN docker-php-ext-install mysqli

COPY . /var/www/html
WORKDIR /var/www/html
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# # Set correct permissions for the www-data user
RUN chown -R www-data:www-data /var/www/html

# Expose the port for Apache
EXPOSE 80

# # Use the default command that starts Apache in the foreground
CMD ["apache2-foreground"]
