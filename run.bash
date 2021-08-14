#!/usr/bin/env bash

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

docker build --tag sjkillen/openvpn-tap .

docker run --rm -tit \
    --net host \
    -v "$PWD/keys:/root/keys" \
    -v "/dev/net:/dev/net" \
    --privileged=true \
    sjkillen/openvpn-tap
