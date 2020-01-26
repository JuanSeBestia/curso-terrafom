#!/bin/bash
# Install Docker
echo --- Update the apt package index ---
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

echo --- Add Docker’s official GPG key ---
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo --- Use the following command to set up the stable repository. --- 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo --- INSTALL DOCKER ENGINE - COMMUNITY ---
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y 

echo --- Start docker service ---
sudo systemd start docker
sudo systemctl enable docker


echo -- Add user ubuntu to group docker --
sudo usermod -aG docker ubuntu
