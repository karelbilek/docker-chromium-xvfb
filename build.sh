#!/usr/bin/env bash

set -ex

docker build -t docker-chromium-xvfb .

#get the chromium version from inside the docker

LONGVERSION=`docker run docker-chromium-xvfb /usr/bin/chromium --version`
#looks something like 'Chromium 90.0.4430.93 built on Debian 10.9, running on Debian 10.9'

SHORTVERSION=`echo $LONGVERSION | sed 's/Chromium \(.*\) built .*/\1/'`

docker tag docker-chromium-xvfb karel3d/docker-chromium-xvfb:latest
docker push karel3d/docker-chromium-xvfb:latest

docker tag docker-chromium-xvfb karel3d/$SHORTVERSION:latest
docker push karel3d/$SHORTVERSION:latest
