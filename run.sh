#!/bin/bash

rm -f /etc/hosts
cp /hosts /etc/hosts
#echo 127.0.0.1 `hostname` >> /etc/hosts

/usr/sbin/sshd -D

