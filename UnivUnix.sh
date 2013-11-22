#!/bin/sh

cd /var/www/univunix.com
case $1 in
	'start')
		screen docpad --env production --offline run;;
	'update')
		sudo docpad update;;
	'upgrade')
		sudo docpad upgrade;;
	'clean')
		docpad clean;;
	'upcontent')
		sudo service nginx stop
		sudo rm -r /var/www/nginx/cache/*
		git pull
		sudo service nginx start;;
esac