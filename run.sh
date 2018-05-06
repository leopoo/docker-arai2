#!/bin/sh
set -e

PUID=${PUID:=0}
PGID=${PGID:=0}

if [ ! -f /conf/aria2.conf ]; then
	cp /conf-default/aria2-default.conf /conf/aria2.conf
	chown $PUID:$PGID /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi

touch /conf/aria2.session
chown $PUID:$PGID /conf/aria2.session

touch /aria2.log
chown $PUID:$PGID /aria2.log

exec s6-setuidgid $PUID:$PGID aria2c --conf-path=/conf/aria2.conf --log=/aria2.log