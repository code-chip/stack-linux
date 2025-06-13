#!/bin/bash

#packages repository develop
sudo apt update && 
apt install git sublime-text docker-compose docker-buildx -y &&
sudo apt install -f
sudo usermod -aG docker $USER &&

#packages repository multimidia
apt install spotify-client flameshot kolourpaint simplescreenrecorder -y &&

#packages repository monitoring
apt install remmina -y &&

#packages terminal
apt install htop bashtop zsh tmux psensor -y &&

#packages site develop
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
curl -L "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website" -o insomnia-lastest.deb &&
sudo dpkg -i insomnia-lastest.deb &&
sudo apt install -f &&
rm insomnia-lastest.deb &&

curl -L "https://code.visualstudio.com/docs/?dv=linux64_deb" -o vscode-lastest.deb &&
sudo dpkg -i vscode-lastest.deb &&
rm vscode-lastest.deb &&

wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb && sudo dpkg -i dbeaver-ce_latest_amd64.deb

#packages snap
sudo rm /etc/apt/preferences.d/nosnap.pref &&
sudo apt update &&
sudo apt install snapd &&
sudo snap install office365webdesktop --beta