# Use an official PHP runtime as a base image
FROM php:7.4-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP script and database configuration file
COPY index.php /var/www/html/
COPY inc/dbinfo.inc /var/www/inc/

# Set permissions (adjust as needed)sudo chown -R ec2-user:apache /var/www
RUN sudo usermod -a -G apache ec2-user
RUN sudo chown -R ec2-user:apache /var/www
RUN sudo chmod 2775 /var/www  
    find /var/www -type d -exec sudo chmod 2775 {} \;
RUN find /var/www -type f -exec sudo chmod 0664 {} \;


# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

