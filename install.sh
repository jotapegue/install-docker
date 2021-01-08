#!/bin/bash

echo 'update your system'
source src/update.sh

echo 'install packages docker dependences'
source src/install-dependence-docker.sh

echo 'download and install key gpg'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo 'confirm key'
sudo apt-key fingerprint 0EBFCD88

echo 'add repository'
source src/add-repository.sh

echo 'update your system'
source src/update.sh

echo 'install docker-ce docker-ce-cli containerd.io'
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo 'download run hello-world on docker'
sudo docker run hello-world

echo "create group docker and add current user ${USER}"
sudo usermod -aG docker ${USER}

echo "list group for ${USER}"
groups ${USER}
