#!/bin/sh

if [[ ! -z "$SITE_TITLE" ]]
then
    sed -i -e 's/#SITE_TITLE/root-title='"$SITE_TITLE"'\n/g' /etc/cgitrc
fi

if [[ ! -z "$SITE_DESC" ]]
then
    sed -i -e 's/#SITE_DESC/root-desc='"$SITE_DESC"'\n/g' /etc/cgitrc
fi

if [[ ! -z $CGIT_USER ]]
then
    htpasswd -bc /etc/.cgit-htpasswd $CGIT_USER "$CGIT_PASS"
    sed -i -e 's/#AUTH/auth_basic "Restricted";\n\tauth_basic_user_file \/etc\/.cgit-htpasswd;/g' /etc/nginx/nginx.conf
fi

supervisord
