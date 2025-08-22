#!/bin/bash
set -e

wg-quick up configs/$CONF.conf

iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -A FORWARD -o wg0 -j ACCEPT

cat tinyproxy.conf | sed "s/Port 8888/Port $PORT/g" > /etc/tinyproxy/tinyproxy.conf

tinyproxy
tail -f /dev/null


