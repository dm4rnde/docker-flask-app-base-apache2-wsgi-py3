
[![](https://images.microbadger.com/badges/image/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](http://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image Layers") [![](https://images.microbadger.com/badges/version/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](http://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image Version") [![](https://images.microbadger.com/badges/license/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](https://microbadger.com/images/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu "Image License")  [![](https://images.microbadger.com/badges/commit/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)](https://github.com/dm4rnde/docker-flask-app-base-apache2-wsgi-py3 "Image Commit")
[![Docker Badge](https://img.shields.io/docker/build/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu.svg)]https://hub.docker.com/r/dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu/builds/)

# Flask(-Apache2-wsgi-Python3-Ubuntu) Docker container


This project (https://github.com/dm4rnde/docker-flask-app-base-apache2-wsgi-py3) was created to have a Docker container that accommodates Flask app (here, ***example Flask app***) which relies on apache2/wsgi/py3.


In other words, result is a Docker container consisting of:

- Apache (running web server);

- wsgi support configured on Apache;

- python3 and pip3 set up;

- Flask app (set up with wsgi and Apache; and running).


***Example Flask app*** (named BasicFlaskApp here);

- is a minimal Flask app;

- its role is just to help to verify that all works;

- as it does not have much content, it could be easily replaced with some other Flask app.


**This project could be used, for example:** 

- **As a base for your own Flask project that require similar characteristics (i.e., when starting new project from beginning).**

- **As additional learning material when learning Docker.**


## Running

### Test run (from code)

1. Clone the project.

2. `cd docker-flask-app-base-apache2-wsgi-py3`

3. Open docker-setup.sh and replace all occurrences of 'writeyourdockeridhere' with your docker id. Then run `sh docker-setup.sh`.

4. Verify that web app works. In browser, open: http://localhost:8888/. The webpage (of ***example Flask app***) should appear.

5. Cleaning up. Open docker-cleanup.sh and replace all occurrences of 'writeyourdockeridhere' with your docker id. Then run `sh docker-cleanup.sh`. 


### When using this project as a basis upon to build your own Flask web app


1. Clone the project.

2. Create a folder for your new project.

3. `cd <your project>`

4. Copy contents of cloned project to your project folder. Rename all occurrences of words 'BasicFlaskApp', 'basicflaskapp', 'bafla' with names that relate to/reflect your project. Introduce your code/edits. <br> Update requirements.txt, if needed (you might require different set of Python packages in your app; example on how to update: `pip3 freeze > requirements.txt`).

5. Once ready, do the test run (create Docker image, create isolated env (network), run Docker container, verify that web app works):

   5.1. `docker build -t <yourdockerid>/<yourimagename>:<yourimageversion> .`

   5.2. `docker network create <yourisolatednetworkname>`

   5.3. `docker run -d --name <nameyourcontainer> --net <yourisolatednetworkname> -p 8888:80 <yourdockerid>/<yourimagename>:<yourimageversion>`

   5.4. In browser, open: http://localhost:8888/. The webpage (of your Flask web app) should appear.
   
   5.5. Cleaning up. Stop and remove the container created in step 5.3. Remove the network created in step 5.2. 


## Notes

- Produced Docker image uses Ubuntu 18.04 as a base image.

- Though not paramount, attempts to have as minimal image (size) as possible.

- **Corresponding Docker images can be found at Docker Hub (hub.docker.com), under repository:** `dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu`
