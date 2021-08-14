#!/usr/bin/env bash
# $1: name

NAME="$1"

echo "<ca>" >> "$NAME.ovpn"
cat ca.crt >> "$NAME.ovpn"
echo "</ca>" >> "$NAME.ovpn"

echo "<cert>" >> "$NAME.ovpn"
cat "$NAME.crt" >> "$NAME.ovpn"
echo "</cert>" >> "$NAME.ovpn"

echo "<key>" >> "$NAME.ovpn"
cat "$NAME.key" >> "$NAME.ovpn"
echo "</key>" >> "$NAME.ovpn"
