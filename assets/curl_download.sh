#!/usr/bin/env bash
curl -OLf \
    -H 'Connection: keep-alive' \
    -H 'Cache-Control: max-age=0' \
    -H 'sec-ch-ua: "Not;A=Brand";v="8", "Chromium";v="150"' \
    -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Linux"' \
    -H 'DNT: 1' -H 'Upgrade-Insecure-Requests: 1' \
    -A 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
    -H 'Sec-Fetch-Site: none' -H 'Sec-Fetch-Mode: navigate' \
    -H 'Sec-Fetch-User: ?1' -H 'Sec-Fetch-Dest: document' \
    --compressed -H 'Accept-Language: en-US,en;q=0.9' \
    "$@"
