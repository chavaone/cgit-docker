
CGIT Docker Image
====================
[![Docker Pulls](https://img.shields.io/docker/pulls/chavaone/cgit-docker.svg?maxAge=2592000)](https://hub.docker.com/r/chavaone/cgit-docker/)

[CGIT](http://git.zx2c4.com/cgit/) is an attempt to create a fast web interface for the git scm, using a builtin cache to decrease server io-pressure.

Git repositories are stored under /data/git-repos and some website assets (CSS file and logo) are stored under /data/assets. You can change these files to customize your site. In addition SITE_TITLE and SITE_DESC enviroment varibles are used to change the root title and the root description.

If you want to add some basic authentication to your site you can use CGIT_USER and CGIT_PASS enviroment variables to set user and password to acceess the site.

This is an example about how to run this container:

    docker run --name cgit -p 8080:80 --privileged -e SITE_TITLE="Awesome CGIT website" -e SITE_DESC="This is an awesome cgit website" -e CGIT_USER=user -e CGIT_PASS=p4ssw0rd -v /path/to/git/repos:/data/git-repos -v /path/to/site/assets:/data/assets chavaone/cgit-docker
