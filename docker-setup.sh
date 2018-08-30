#!/bin/bash

# build image
docker build -t writeyourdockeridhere/flask-app-base-apache2-wsgi-py3-ubuntu:latest .

# create network (isolated env)
docker network create basicflaskapp-netw

# start container (detach, name, start in isolated network, map the ports)
docker run -d --name bflaskapp --net basicflaskapp-netw -p 8888:80 writeyourdockeridhere/flask-app-base-apache2-wsgi-py3-ubuntu:latest
