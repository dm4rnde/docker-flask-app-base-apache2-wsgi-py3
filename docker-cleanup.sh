#!/bin/bash

# stop container
docker stop $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:0.1" | awk '{ print $1}')

# remove container
docker rm $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:0.1" | awk '{ print $1}')

# remove image
docker rmi dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1

# remove network
docker network rm basicflaskapp-netw
