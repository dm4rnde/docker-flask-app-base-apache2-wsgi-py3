#!/bin/bash

# build an image
docker build -t dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1 .

# start the container
docker run -d -p 8888:80 dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1
