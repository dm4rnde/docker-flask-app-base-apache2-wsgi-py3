
[![](https://images.microbadger.com/badges/license/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](https://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image License") [![](https://images.microbadger.com/badges/image/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](http://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image Layers") [![](https://images.microbadger.com/badges/version/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](http://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image Version") [![](https://images.microbadger.com/badges/commit/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](https://github.com/dm4rnde/docker-flask-app-base-apache2-wsgi-py3 "Image Commit") [![Docker Badge](https://img.shields.io/docker/build/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](https://hub.docker.com/r/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu/builds/)

# Flask(-Apache2-wsgi-Python3-Ubuntu) Docker image

Environment set up to run Flask app.

To be more specific, resulting Docker container, created from this image, would have:

- Apache (running web server);

- wsgi configured on Apache;

- python3 and pip3 set up;

- Flask app (set up with wsgi and Apache; and running).


To verify that all works, minimal ***example Flask app*** - named BasicFlaskApp here - is used. As ***example Flask app*** does not have much content it could be easily replaced with some other Flask app.


This project could be used, for example:

- as a base for (or for bootstrapping) Flask project that require similar characteristics (i.e., starting fresh project from beginning);

- as additional learning material when learning Docker.


## Running (from code)

### Test run

To verify that it works.

1. Clone the project.

2. `cd docker-flask-app-base-apache2-wsgi-py3`

3. `docker-compose build` (or with env variables - see comments in Dockerfile under 'To get following env arguments filled')

4. `docker-compose up -d`

5. Verify. In browser, open: http://localhost:8888/. The webpage (of ***example Flask app***) should appear.

6. `docker-compose down`


### When using this project as a basis upon to build your own Flask web app


1. Clone the project.

2. Create a folder for your new project.

3. `cd <your project>`

4. Copy contents of cloned project to your project folder. Rename all occurrences of words 'BasicFlaskApp', 'basicflaskapp', 'bafla' with names that relate to/reflect your project. Introduce your code/edits. For example, you might consider updating requirements.txt (you might require different set of Python packages in your app; example on how to update: `pip3 freeze > requirements.txt`), docker-compose.yml.

5. Once ready, do the test run (following will: create Docker image, create isolated env (network), run Docker container; verify that web app works; clean up - stop and remove container, remove network):

   5.1. `docker-compose build` (or with env variables - see comments in Dockerfile under 'To get following env arguments filled')

   5.2. `docker-compose up -d`

   5.3. In browser, open: http://localhost:8888/. The webpage (of your Flask web app) should appear.
   
   5.4. `docker-compose down`


## Notes

- Uses Ubuntu 18.04 as a base image.

- This solution does not set up virtual/isolated Python environment (i.e., such created by virtualenv) but uses global python/pip,
because there is one running Flask app. To change this (for example, in order to have many Flask apps on same container or there is other situation that require different isolated Python environments), additional work is needed to set up virtual Python environments (need to do changes to Dockerfile).

- Though not paramount, attempts to have as minimal image (size) as possible.

- Dev env specifics: docker-compose 1.22.0,  Docker 18.06.1-ce

- **Corresponding Docker images are automatically built to (and can be pulled from) public repository at:** https://hub.docker.com/r/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu/
