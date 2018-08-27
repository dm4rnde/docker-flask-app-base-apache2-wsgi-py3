#!/bin/bash

docker stop $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:0.1" | awk '{ print $1}')
docker rm $(docker ps -a | grep "flask-app-base-apache2-wsgi-py3-ubuntu:0.1" | awk '{ print $1}')
docker rmi dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1
docker network rm basicflaskapp-netw
