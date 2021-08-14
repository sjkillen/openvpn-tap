FROM ubuntu

# Following guide: https://codentium.com/using-openvpn-to-play-old-games-with-your-friends.html

RUN apt-get -qq update && apt-get -qq install openvpn easy-rsa
COPY games.conf /etc/openvpn
COPY init.bash /root/init.bash

CMD "/root/init.bash"
