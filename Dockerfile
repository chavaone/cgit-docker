FROM alpine:edge
MAINTAINER Marcos Chavarría Teijeiro <chavarria1991@gmail.com>

# Update and Install dependencies
RUN apk update && \
    apk add nginx \
            fcgiwrap \
            cgit \
            supervisor && \
    rm -rf /var/cache/apk/*

VOLUME ["/data/git-repos", "/data/assets"]

# Configure nginx, cgit and supervisord
RUN mkdir /run/nginx
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/cgitrc /etc/cgitrc
COPY config/assets/cgit.css /data/assets/cgit.css
COPY config/assets/cgitlogo.png /data/assets/logo.png
COPY config/supervisord.conf /etc/supervisor.d/conf.ini

EXPOSE 80

CMD ["supervisord"]
