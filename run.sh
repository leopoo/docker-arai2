#!/bin/sh
set -e


if [ ! -f /conf/aria2.conf ]; then
	cp /conf-default/aria2-default.conf /conf/aria2.conf
	if [ $SECRET ]; then
		echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
	fi
fi

touch /conf/aria2.session

touch /aria2.log

exec aria2c --conf-path=/conf/aria2.conf --log=/aria2.log