# docker-seafile-onlyoffice

Using `docker-compose` to deploy seafile-pro (current version: 6.3.13) with OnlyOffice support.

DIR `ci` contains scripts for travis CI.
DIR `deploy` contains files for using docker-compose to deploy `seafile-pro` with OnlyOffice support.
DIR `image` contains files for building docker images in this repo.

## Build images

Enter `image` DIR, then check `Makefile` to build images. You may change `fsslc` to another name.

## Deploy

Enter `deploy` DIR, then Using `docker-compose` to deploy.

For convience, in `deploy/docker-compose.yml`, I've Fixed IP address of service seafile and onlyoffice.

For those who want to change IP address, Please change `deploy/conf/seafile.nginx.conf.template` line 112 and `deploy/docker-compose.yml` line 18,21,32,46.
