#!/usr/bin/env bash
# $1 name

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

NAME="$1"

mkdir "clients/$NAME"
cd keys
./easyrsa gen-req "$NAME" nopass
./easyrsa sign-req serverClient "$NAME"

cp "pki/private/$NAME.key" "../clients/$NAME"
cp "pki/issued/$NAME.crt" "../clients/$NAME"
cp "pki/ca.crt" "../clients/$NAME"
cp ../schema.ovpn "../clients/$NAME/$NAME.ovpn"

cd "../clients/$NAME"
../../make_ovpn.bash "$NAME"
