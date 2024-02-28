#!/bin/bash
exec 3<>/dev/tcp/localhost/80

echo -e "GET /management/health HTTP/1.1\nhost: localhost:80\n" >&3

timeout --preserve-status 3 cat <&3 | grep -m 1 status | grep -m 1 UP
ERROR=$?

exec 3<&-
exec 3>&-

exit $ERROR
