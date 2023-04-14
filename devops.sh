#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Enable UFW firewall and allow SSH traffic
sudo apt install -y ufw
sudo ufw allow ssh
sudo ufw enable

# Disable root login
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo systemctl reload sshd

# Install necessary packages
sudo apt install -y curl wget software-properties-common apt-transport-https openjdk-8-jdk

# Install Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Install Jira
sudo wget -O /etc/apt/sources.list.d/atlassian.list https://packages.atlassian.com/atlassian-sdk-deb/atlassian-sdk-deb.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73
sudo apt-get update
sudo apt-get install -y atlassian-plugin-sdk

# Install GameMaker Studio
sudo wget https://cdn.yoyogames.com/downloads/gms2/Studio-2.3.5.584.tar.gz
sudo tar -xvf Studio-2.3.5.584.tar.gz
sudo rm Studio-2.3.5.584.tar.gz
sudo ./Studio-2.3.5.584/bin/gmstudio

# Install Android Studio
sudo snap install android-studio --classic

# Install Adobe Photoshop, Illustrator, and Sketch
sudo snap install photoshop-cc-2021 illustrator-cc-2021 sketch

# Install Wwise
sudo wget https://www.audiokinetic.com/wp-content/uploads/2022/02/Wwise_2022.1.8.7949_LinuxAPI.zip
sudo unzip Wwise_2022.1.8.7949_LinuxAPI.zip -d /opt
sudo rm Wwise_2022.1.8.7949_LinuxAPI.zip
sudo ln -s /opt/Wwise_2022.1.8.7949_LinuxAPI/Authoring/x64/bin/Wwise /usr/local/bin/Wwise

# Install Asana
sudo snap install asana

# Install Google Analytics
sudo apt install -y google-chrome-stable
sudo wget https://dl.google.com/analytics/clientlibs/ga_reporting_api/v4/ga-4.2.0-linux-x64.tar.gz
sudo tar -xvf ga-4.2.0-linux-x64.tar.gz
sudo rm ga-4.2.0-linux-x64.tar.gz
sudo ln -s /path/to/ga-4.2.0-linux-x64/bin/ga /usr/local/bin/ga

# Install Microsoft Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

# Install Terraform
sudo wget https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip
sudo unzip terraform_1.0.7_linux_amd64.zip -d /usr/local/bin/

# Install Docker
curl https://get.docker.com | sh
sudo usermod -aG docker $(whoami)

# Install Kubernetes
sudo snap install kubectl --classic
sudo snap install kubelet --classic
sudo snap install kubeadm --classic

# Install Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.29.2/prometheus-2.29.2.linux-amd64.tar.gz
tar -zxvf prometheus-2.29.2.linux-amd64.tar.gz
cd prometheus-2.29.2.linux-amd64/
./prometheus --config.file=prometheus.yml &

echo "All software has been installed."
