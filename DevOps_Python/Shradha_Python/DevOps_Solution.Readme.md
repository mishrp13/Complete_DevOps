Q 41. 

# Use Ubuntu 24.04 as base image
FROM ubuntu:24.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Configure Apache to listen on port 5000
RUN sed -i 's/80/5000/g' /etc/apache2/ports.conf && \
    sed -i 's/:80/:5000/g' /etc/apache2/sites-available/000-default.conf

# Expose port 5000
EXPOSE 5000

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]

curl -Ik http://localhost:5000


Q 42:

 docker network create --driver macvlan --subnet 172.168.0.0/24 --ip-range 172.168.0.0/24 news 

 Q 43:

 docker run -d --name=media -p 8086:80 nginx:stable 

 

