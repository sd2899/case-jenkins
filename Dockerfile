FROM ubuntu:latest
RUN apt-get update 
RUN apt-get install apache2 -y
COPY . /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]
