#!/bin/bash
set -eux

mkdir -p ~vuls/.ssh
cp /data/authorized_keys ~vuls/.ssh/
chmod 700 ~vuls/.ssh
chmod 600 ~vuls/.ssh/authorized_keys
chown -R vuls:vuls ~vuls/.ssh

exec /usr/sbin/sshd -D