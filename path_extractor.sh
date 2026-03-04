#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

URL=$1
DOMAIN=$(echo "$URL" | sed -E 's|https?://||; s|/.*||')
OUTPUT_FILE="paths_${DOMAIN}.txt"

echo "[+] Scanning: $URL"
echo "[+] Target Domain: $DOMAIN"

curl -sL -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" "$URL" \
| grep -oE 'href="([^"#]+)"' \
| cut -d'"' -f2 \
| sed "s~https\?://$DOMAIN~~g; s~//$DOMAIN~~g; s|^//|/|" \
| grep "^/" \
| grep -vE "\.(css|js|png|jpg|jpeg|svg|gif|ico|woff|pdf|webp)" \
| grep -v "wp-content/cache" \
| sort -u > "$OUTPUT_FILE"

LINE_COUNT=$(wc -l < "$OUTPUT_FILE")

echo "[!] Done! Found $LINE_COUNT unique clean paths."
echo "[!] Results saved to: $OUTPUT_FILE"

echo "[+] Validating paths (following redirects)..."
printf "%-10s %-60s\n" "STATUS" "PATH"
printf "%-10s %-60s\n" "------" "----"

while read -r path; do
    
	status=$(curl -o /dev/null -sL -w "%{http_code}" "$URL$path")
    
	printf "%-10s %-60s\n" "[$status]" "$path"

done < "$OUTPUT_FILE"
