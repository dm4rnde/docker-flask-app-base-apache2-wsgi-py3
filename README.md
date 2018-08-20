
<br>

# Flask(-Apache2-wsgi-Python3-Ubuntu) Docker container

<br>

#### IN SHORT

This project was created to be able to have Docker container that accommodates Flask app (here, ***example Flask app***) which relies on apache2/wsgi/py3.

The role of the ***example Flask app*** (BasicFlaskApp) here is to have any minimal flask app to verify that all works.

<br>

#### LONG DESCRIPTION

In other words, this project is for creating Docker image from which you could have Docker container consisting of:

- Apache (running web server)

- wsgi support configured on Apache

- python3 and pip3 set up

- Flask app (set up with wsgi and Apache; and running)

<br>

**You could use this project:** 

- **As a base for your own Docker image / Flask app that have similar characteristics.**

- **As a learning material, when learning Docker.**

<br>

## Running

### Test run

1. Clone the project.

2. `cd docker-flask-app-base-apache2-wsgi-py3`

3. `sh setup-docker.sh`

4. Verify that web app works. In browser, open: http://localhost:8888/. The webpage (of ***example Flask app***) should appear.

5. Stop the container created in step 3.

<br>

### When using this project as a basis upon to build your own Flask web app


1. Clone the project.

2. Create folder for your new project.

3. `cd <your project>`

4. Copy contents of cloned project to your project. Rename all occurrences of words 'BasicFlaskApp', 'basicflaskapp', 'bafla' with names that relate to/reflect your project. Introduce your code/edits. <br> Update requirements.txt, if needed (you might require different set of Python packages in your app; example on how to update: `pip3 freeze > requirements.txt`).

5. Once ready, do the test run (create Docker image, run Docker container, verify that web app works):

   5.1. `docker build -t <yourdockerid>/<yourimagename>:<yourimageversion> .`

   5.2. `docker run -d -p 8888:80 <yourdockerid>/<yourimagename>:<yourimageversion>`

   5.3. In browser, open: http://localhost:8888/. The webpage (of your Flask web app) should appear.
   
   5.3. Stop the container created in step 5.2.

<br>

## Notes

- Produced Docker image uses Ubuntu 18.04 as a base image.

- **Corresponding Docker image has been uploaded to, and can be found at, Docker Hub (hub.docker.com) as:** `dm4rnde/flask-app-base-apache2-wsgi-py3-ubuntu:0.1`
