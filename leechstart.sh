#!/bin/bash


sudo apt install python3 python3-pip
echo yes | pip3 install -r requirements-cli.txt
echo yes | pip3 install -r requirements.txt
echo yes | sudo docker container prune
echo yes | sudo docker image prune -a
sudo dockerd
sudo docker build . -t fcb
sudo docker run -p 51:51 fcb
