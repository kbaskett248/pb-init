#!/usr/bin/env bash

if [ -d "~/downloads" ]; then
    echo "downloads directory exists"
else
    mkdir ~/downloads
fi

if [ -d "~/projects" ]; then
    echo "projects directory exists"
else
    mkdir ~/projects
    mkdir ~/projects/python
fi

if [ -d "~/.ssh" ]; then
    echo "ssh directory exists"
else
    mkdir ~/.ssh
    echo "# GitLab.com" >> ~/.ssh/config
    echo "Host gitlab.com" >> ~/.ssh/config
    echo "  Preferredauthentications publickey" >> ~/.ssh/config
    echo "  IdentityFile ~/.ssh/gitlab_com_rsa" >> ~/.ssh/config
    echo "" >> ~/.ssh/config
    echo "# Bitbucket.com" >> ~/.ssh/config
    echo "Host bitbucket.com" >> ~/.ssh/config
    echo "  Preferredauthentications publickey" >> ~/.ssh/config
    echo "  IdentityFile ~/.ssh/bitbucket_com_rsa" >> ~/.ssh/config
    echo "" >> ~/.ssh/config
    echo "# Github.com" >> ~/.ssh/config
    echo "Host github.com" >> ~/.ssh/config
    echo "  Preferredauthentications publickey" >> ~/.ssh/config
    echo "  IdentityFile ~/.ssh/github_com_rsa" >> ~/.ssh/config
    echo "" >> ~/.ssh/config
fi

if which pyenv; then
    echo "pyenv already installed"
else
    curl https://pyenv.run | bash
    pyenv install 3.7.2
    pyenv global 3.7.2
fi

if which poetry; then
    echo "poetry already installed"
else
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
fi

if which code; then
    echo "VS Code already installed"
else
    curl -o ~/downloads/vscode.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
    sudo dpkg -i ~/downloads/vscode.deb
fi

if [ -d "/opt/"]; then
    echo "PyCharm already installed"
else
    curl -o ~/downloads/pycharm-community-2018.3.4.tar.gz -L https://download.jetbrains.com/python/pycharm-community-2018.3.4.tar.gz
    sudo tar xf ~/downloads/pycharm-community-2018.3.4.tar.gz -C /opt/
    sudo echo "[Desktop Entry]" >> /usr/share/applications/pycharm.desktop
    sudo echo "Version=13.0" >> /usr/share/applications/pycharm.desktop
    sudo echo "Type=Application" >> /usr/share/applications/pycharm.desktop
    sudo echo "Terminal=false" >> /usr/share/applications/pycharm.desktop
    sudo echo "Icon[en_US]=/opt/pycharm-community-2018.3.4/bin/pycharm.png" >> /usr/share/applications/pycharm.desktop
    sudo echo "Name[en_US]=PyCharm" >> /usr/share/applications/pycharm.desktop
    sudo echo "Exec=/opt/pycharm-community-2018.3.4/bin/pycharm.sh" >> /usr/share/applications/pycharm.desktop
    sudo echo "Name=PyCharm" >> /usr/share/applications/pycharm.desktop
    sudo echo "Icon=/opt/pycharm-community-2018.3.4/bin/pycharm.png" >> /usr/share/applications/pycharm.desktop
fi
