#!/bin/bash

# stop container
docker stop $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:latest" | awk '{ print $1}')

# remove container
docker rm $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:latest" | awk '{ print $1}')

# remove image
docker rmi writeyourdockeridhere/flask-app-base-apache2-wsgi-py3-ubuntu:latest

# remove network
docker network rm basicflaskapp-netw
