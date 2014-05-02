#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

cd /home/vagrant
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git-core -y
sudo apt-get install devscripts -y
sudo apt-get build-dep epic5 -y
git clone https://github.com/bergsas/epic5-debuild
cd epic5-debuild
./everything.sh
cp *.deb /vagrant/
