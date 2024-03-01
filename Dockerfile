# Use an official PHP runtime as a base image
FROM php:7.4-apache

# Set metadata for the image
LABEL maintainer="Chinnayya Chintha <chinnayya.chintha143@gmail.com>"
LABEL description="A simple PHP application with MySQL support"

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP script and database configuration file
COPY html/index.php /var/www/html/
COPY inc/dbinfo.inc /var/www/inc/

# Set permissions (adjust as needed)
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

