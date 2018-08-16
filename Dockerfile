FROM ubuntu:18.04

RUN apt-get update -y ; apt-get upgrade -y
RUN apt-get install -y apache2 --no-install-recommends; apt-get install -y libapache2-mod-wsgi-py3 --no-install-recommends
RUN a2enmod wsgi

RUN mkdir /var/www/BasicFlaskApp
COPY . /var/www/BasicFlaskApp

RUN cd /usr/local/bin ; ln -s /usr/bin/python3 python

# need to get up to date pip
RUN apt-get install -y wget --no-install-recommends
RUN adduser --system --group --disabled-login bflaskappuser ; cd /home/bflaskappuser/
RUN apt-get update -y ; apt-get upgrade -y
RUN apt-get install -y python3-pip --no-install-recommends
RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' ; python get-pip.py --disable-pip-version-check --no-cache-dir
# pip should be now pip3
RUN pip --version ; rm -f get-pip.py

RUN pip install --no-cache-dir -r /var/www/BasicFlaskApp/requirements.txt

RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

COPY BasicFlaskApp.conf /etc/apache2/sites-available/BasicFlaskApp.conf
RUN a2ensite BasicFlaskApp

RUN rm -rf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /etc/apache2/sites-enabled/000-default.conf

RUN rm -rf /var/www/BasicFlaskApp/BasicFlaskApp.conf
RUN rm -rf /var/www/BasicFlaskApp/Dockerfile
RUN rm -rf /var/www/BasicFlaskApp/requirements.txt

#once ServerName is known, need to remove following
#line (it sets 'ServerName' directive globally)
#and have ServerName in related conf file(s) (under 
#sites-available, inside the VirtualHost section)
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
 
RUN service apache2 start
RUN sleep 10

RUN chown -R bflaskappuser:www-data /var/www/BasicFlaskApp

RUN service apache2 stop
RUN sleep 10

RUN service apache2 start
RUN sleep 4

EXPOSE 80 443

RUN apt-get clean

ENTRYPOINT ["/bin/bash", "/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
