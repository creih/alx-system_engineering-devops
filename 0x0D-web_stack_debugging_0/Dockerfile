FROM ubuntu:latest

# Install Apache
RUN apt-get update && \
    apt-get install -y apache2

# Configure Apache to serve Hello Holberton page
RUN echo "Hello Holberton" > /var/www/html/index.html

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
