#!/bin/bash

# build an image
docker build -t dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1 .

# create a network (isolated env)
docker network create basicflaskapp-netw

# start the container (detach, name, start in isolated network, map the ports)
docker run -d --name bflaskapp --net basicflaskapp-netw -p 8888:80 dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1
