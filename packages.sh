#!/bin/bash

#PACKAGES REPOSITORY DEVELOP
sudo apt update && sudo apt install git -y && \
# Docker
sudo sudo apt install ca-certificates curl gnupg lsb-release -y
# Create repository for the key
sudo mkdir -p /etc/apt/keyrings
# Download and install the key GPG of Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add the repository Docker oficial
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update packages
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y && \
sudo usermod -aG docker $USER && \
# Sublime Text
# Import the GPG key: This key is used to verify the authenticity of packages from the Sublime Text repository.
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && \
# Add the Sublime Text repository: Choose either the stable or dev channel.
# Stable channel:
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && \
sudo apt update && \
sudo apt install sublime-text -y && \

#PACKAGES REPOSITORY MULTIMIDIA
sudo apt -y install flameshot kolourpaint simplescreenrecorder && \
#spotify client - you will first need to configure our debian repository:
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg && \
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list && \
sudo apt-get update && sudo apt-get install spotify-client && \

#PACKAGES REPOSITORY MONITORING
sudo apt install remmina -y && \

#PACKAGES TERMINAL
sudo apt install -y htop bashtop zsh tmux psensor && \

#PACKAGES SITE DEVELOP
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
curl -L "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website" -o insomnia-latest.deb && \
sudo dpkg -i insomnia-latest.deb && \
sudo apt install -f && \
rm insomnia-latest.deb && \

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o vscode-latest.deb && \
sudo dpkg -i vscode-latest.deb && \
rm vscode-latest.deb && \

curl -L "https://discord.com/api/download?platform=linux&format=deb" -o discord-latest.deb && \
sudo dpkg -i discord-latest.deb && \
rm discord-latest.deb && \

wget -O dbeaver-ce_latest_amd64.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb && \
sudo dpkg -i dbeaver-ce_latest_amd64.deb && \
rm dbeaver-ce_latest_amd64.deb && \
