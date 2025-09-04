#!/bin/bash

if [ -z "$1" ]; then
    echo "Use: $0 <URL>"
    exit 1
fi

URL=$1
DOMAIN=$(echo "$URL" | sed -E 's~https?://~~; s~/.*~~')

echo "[+] Extracting unique paths from: $DOMAIN"

curl -s "$URL" \
| grep -oP "https?://$DOMAIN(/[a-zA-Z0-9._/?=&%-]*)" \
| sed -E "s~https?://$DOMAIN~~" \
| sort -u
