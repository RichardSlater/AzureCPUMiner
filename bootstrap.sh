#!/usr/bin/env bash

apt-get --quiet --assume-yes --force-yes update
apt-get --quiet --assume-yes --force-yes upgrade
apt-get --quiet --assume-yes --force-yes autoremove
apt-get --quiet --assume-yes --force-yes install git build-essential libcurl4-openssl-dev libncurses5-dev pkg-config automake yasm
git clone https://github.com/pooler/cpuminer.git /usr/src/cpuminer
cd /usr/src/cpuminer
./autogen.sh
./configure CFLAGS="-O3"
make
wget -O '/etc/systemd/system/minerd.service' 'https://www.dropbox.com/s/wm7d7s08fw4hvv8/minerd.service?dl=1'
systemctl enable /etc/systemd/system/minerd.service
systemctl start minerd
