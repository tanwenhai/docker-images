#!/bin/sh
set -e
exec /usr/sbin/sshd -D
exec "$@"
