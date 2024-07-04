#!/bin/bash

for i in $(seq 1 10); do
    curl 'http://192.168.8.124:8080/WebGoat/HijackSession/login' \
    -H 'Connection: keep-alive' \
    -H 'Accept: */*' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'User-Agent: any' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'Origin: http://localhost:8080' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Referer: http://localhost:8080/WebGoat/start.mvc' \
    -H 'Accept-Language: en-US,en;q=0.9' \
    -H "Cookie: JSESSIONID=HX0yrDDzDYMP05cfK9wVKIOuLF7DmKXjKJLbt2tY" \
    --data-raw 'username=lewis1&password=lewislewis' \
    --compressed \
    --output /dev/null\
    -v
done



