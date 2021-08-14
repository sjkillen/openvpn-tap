#!/usr/bin/env bash

iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o enp9s0 -j MASQUERADE
sysctl -w net.ipv4.ip_forward=1

openvpn --config /home/gopher/openvpn-tap/games.conf 
