# Introduction

This repository provides a simple python application in the Flask framework wrapped  to docker container which provides docker version output through http in json format.

# Prerequisites.

Host with OS Linux

To successfull build and run applicaition ,please instaall and start docker software on target host. Please refer to https://store.docker.com.

*OPTIONAL* If you would like to defining and running multi-container Docker applications in easy way, please install docker-compose tool. To learn more please refer to  https://docs.docker.com/compose/.

# Layout

The repository is broken up into two directories currently:

* *pybase* - contains Dockerfile to build base image with sdk, python2 and pip tool.
* *flask_app* - contains Dockerfile, requirements.txt, app to build image with application and necessary python's modules to run it.

Files:

* *build.sh* - batch Shell script which builds two images ['pybase:1.0','docker_ver:1.0'] by default and generates docker-compose.yml
* *docker-compose.yml* - YAML file to start an application.

# Buiold

* *./build.sh "<image>" "<tag>"* - image: ['pybase','docker_ver']  by default, tag: '1.0' by default.

# Run
To start application please run 

docker run -d -v /var/run/docker.sock:/var/run/docker.sock \
           -p 5080:5000 \
           --restart always \
           lab/docker_ver:1.0 

    or

docker-compose up -d

# External resources

* [Docker](https://www.docker.com)
* [iCompose tool](https://docs.docker.com/compose/)
* [GitHub docker-compose](https://github.com/docker/compose)
