#!/usr/bin/env bash
# https://nixos.org/download.html#nixos-iso

# -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0' \
# -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-site' -H 'Sec-Fetch-User: ?1'
# -H 'Referer: https://nixos.org/' \
# -H 'Upgrade-Insecure-Requests: 1' \
# -H 'Accept-Language: en-US,en;q=0.5' \
# -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' \
#    -H 'Accept-Encoding: gzip, deflate, br' \
#    -H 'Connection: keep-alive' \
VER_MAJOR=23.11
VER_MINOR=2413.32f63574c85f
ARCH=x86_64-linux
ISO_FILE_NAME=nixos-minimal-$VER_MAJOR.$VER_MINOR-$ARCH.iso

curl "https://releases.nixos.org/nixos/$VER_MAJOR/nixos-$VER_MAJOR.$VER_MINOR/$ISO_FILE_NAME" \
    -o $HOME/Downloads/dist/nixos/$ISO_FILE_NAME
