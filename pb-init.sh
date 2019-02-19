#!/usr/bin/env bash

apt update
sudo apt --fix-broken install
sudo apt upgrade

if [ -d ~/downloads ]; then
    echo "downloads directory exists"
else
    mkdir ~/downloads
fi

if [ -d ~/projects ]; then
    echo "projects directory exists"
else
    mkdir ~/projects
    mkdir ~/projects/python
fi

git config --global user.email "kbaskett248@gmail.com"
git config --global user.name "Kenneth Baskett"

if [ -d ~/.ssh ]; then
    echo "ssh directory exists"
else
    mkdir ~/.ssh
    
fi

SSH_CONFIG="$HOME/.ssh/config"
if [ -f $SSH_CONFIG ]; then
    echo "ssh config already exists"
else
    echo "# GitLab.com" >> $SSH_CONFIG
    echo "Host gitlab.com" >> $SSH_CONFIG
    echo "  Preferredauthentications publickey" >> $SSH_CONFIG
    echo "  IdentityFile ~/.ssh/gitlab_com_rsa" >> $SSH_CONFIG
    echo "" >> $SSH_CONFIG
    echo "# Bitbucket.com" >> $SSH_CONFIG
    echo "Host bitbucket.com" >> $SSH_CONFIG
    echo "  Preferredauthentications publickey" >> $SSH_CONFIG
    echo "  IdentityFile ~/.ssh/bitbucket_com_rsa" >> $SSH_CONFIG
    echo "" >> $SSH_CONFIG
    echo "# Github.com" >> $SSH_CONFIG
    echo "Host github.com" >> $SSH_CONFIG
    echo "  Preferredauthentications publickey" >> $SSH_CONFIG
    echo "  IdentityFile ~/.ssh/github_com_rsa" >> $SSH_CONFIG
    echo "" >> $SSH_CONFIG
fi

GITHUB_SSH="$HOME/.ssh/github_com_rsa"
if [ -f $GITHUB_SSH ]; then
    echo "github ssh already exists"
else
    echo "run \"ssh-keygen -o -t rsa -b 4096 -C \"Github kbaskett248@gmail.com\" -f $GITHUB_SSH\""
fi

GITLAB_SSH="$HOME/.ssh/gitlab_com_rsa"
if [ -f $GITHUB_SSH ]; then
    echo "gitlab ssh already exists"
else
    echo "run \"ssh-keygen -o -t rsa -b 4096 -C \"Github kbaskett248@gmail.com\" -f $GITLAB_SSH\""
fi

BITBUCKET_SSH="$HOME/.ssh/gitlab_com_rsa"
if [ -f $GITHUB_SSH ]; then
    echo "gitlab ssh already exists"
else
    echo "run \"ssh-keygen -o -t rsa -b 4096 -C \"Github kbaskett248@gmail.com\" -f $BITBUCKET_SSH\""
fi

if which pyenv; then
    echo "pyenv already installed"
else
    curl https://pyenv.run | bash
    export PATH=~/.pyenv/bin:$PATH
    pyenv install 3.7.2
fi

if which poetry; then
    echo "poetry already installed"
else
    pyenv global 3.7.2
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
fi

if which code; then
    echo "VS Code already installed"
else
    curl -o ~/downloads/vscode.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
    sudo dpkg -i ~/downloads/vscode.deb
fi

if [ -d /opt/pycharm-community-2018.3.4 ]; then
    echo "PyCharm already installed"
else
    curl -o ~/downloads/pycharm-community-2018.3.4.tar.gz -L https://download.jetbrains.com/python/pycharm-community-2018.3.4.tar.gz
    sudo tar xf ~/downloads/pycharm-community-2018.3.4.tar.gz -C /opt/
fi

PYCHARM_SHORTCUT="/usr/share/applications/pycharm.desktop"
if [ -f $PYCHARM_SHORTCUT ]; then
    echo "pycharm shortcut exists"
else
    echo "[Desktop Entry]" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Version=13.0" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Type=Application" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Terminal=false" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Icon[en_US]=/opt/pycharm-community-2018.3.4/bin/pycharm.png" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Name[en_US]=PyCharm" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Exec=/opt/pycharm-community-2018.3.4/bin/pycharm.sh" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Name=PyCharm" | sudo tee -a $PYCHARM_SHORTCUT
    echo "Icon=/opt/pycharm-community-2018.3.4/bin/pycharm.png" | sudo tee -a $PYCHARM_SHORTCUT
fi

if which ssh-askpass; then
    echo "ssh-askpass already installed"
else
    sudo apt install ssh-askpass
fi
