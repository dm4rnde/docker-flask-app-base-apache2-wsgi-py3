FROM ubuntu:18.04

RUN apt-get update -y ; apt-get upgrade -y
RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends
RUN a2enmod wsgi

RUN mkdir /var/www/BasicFlaskApp
COPY . /var/www/BasicFlaskApp

RUN cd /usr/local/bin ; ln -s /usr/bin/python3 python

# Need to get up to date pip
RUN apt-get install -y wget --no-install-recommends
RUN adduser --system --group --disabled-login bflaskappuser ; cd /home/bflaskappuser/
RUN apt-get update -y ; apt-get upgrade -y
RUN apt-get install -y python3-pip --no-install-recommends
RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' ; python get-pip.py --disable-pip-version-check --no-cache-dir
# pip should be now pip3
RUN pip --version ; rm -f get-pip.py

#temp looking for workaround
#https://github.com/pypa/pip/issues/6158
#RUN pip install --no-cache-dir -r /var/www/BasicFlaskApp/requirements.txt
RUN pip install -r /var/www/BasicFlaskApp/requirements.txt

RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

COPY BasicFlaskApp.conf /etc/apache2/sites-available/BasicFlaskApp.conf
RUN a2ensite BasicFlaskApp

RUN rm -rf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf

RUN rm -rf /var/www/BasicFlaskApp/BasicFlaskApp.conf
RUN rm -rf /var/www/BasicFlaskApp/Dockerfile
RUN rm -rf /var/www/BasicFlaskApp/requirements.txt

RUN service apache2 start
RUN sleep 10

RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

RUN service apache2 stop
RUN sleep 10

RUN service apache2 start
RUN sleep 4

EXPOSE 80 443

RUN apt-get clean

# To get following env arguments filled
# a) if you build an image manually then set the arguments
#  example (1):
#  docker build \
#  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#  --build-arg VCS_REF=`git rev-parse --short HEAD` \
#  --build-arg VERSION="latest" \
#  -t dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu .
#
#  example (2) [use this option]:
#  docker-compose build \
#  --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
#  --build-arg VCS_REF=`git rev-parse --short HEAD` \
#  --build-arg VERSION="latest"
#
# b) if you let Docker Hub registry do the autobuild 
#  then specify build command with arguments in hooks/build
#

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker image with flask app base (using apache2, wsgi, py3, ubuntu)" \
      org.label-schema.description="Docker image to create docker container from, that accommodates Flask web app which relies on Apache 2, wsgi, Python 3, and Ubuntu." \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/dm4rnde/docker-flask-app-base-apache2-wsgi-py3" \
      org.label-schema.docker.schema-version="1.0"

ENTRYPOINT ["/bin/bash", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
