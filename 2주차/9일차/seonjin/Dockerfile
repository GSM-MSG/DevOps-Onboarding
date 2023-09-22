FROM ubuntu:20.04

RUN apt-get update && apt-get install -y vim apache2

EXPOSE 80 

CMD ["apachectl", "-D", "FOREGROUND"]