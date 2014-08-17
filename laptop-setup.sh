#!/bin/sh

# Installation
#
# wget -qO- https://raw.githubusercontent.com/jacobparra/laptop-setup/master/laptop-setup.sh | sh -
#
# References
#
# http://www.unixmen.com/top-things-installing-ubuntu-14-0413-1013-0412-1012-04/
# http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-04-trusty-tahr
# http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu
#
# "Ubuntu 14.04 LTS Trusty Tahr - Basic packages i usually install"
# https://gist.github.com/h4cc/7be7f940325614dc59fb
#

echo "*************************************************************"


echo "*****    Upgrading    *****"
sudo apt-get -y --force-yes update && sudo apt-get -y --force-yes upgrade


echo "*************************************************************"


echo "*****    Adding repositories    *****"

sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:sunab/kdenlive-release
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:freyja-dev/unity-tweak-tool-daily

# Google Chrome & Talk plugin
sudo sh -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list"
sudo sh -c "echo 'deb http://dl.google.com/linux/talkplugin/deb/ stable main' >> /etc/apt/sources.list.d/google-talkplugin.list"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# NodeJS
sudo sh -c "echo 'deb https://deb.nodesource.com/node $(lsb_release -sc) main' > /etc/apt/sources.list.d/nodesource.list"
#sudo sh -c "echo 'deb-src https://deb.nodesource.com/node $(lsb_release -sc) main' >> /etc/apt/sources.list.d/nodesource.list"
wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

# Virtualbox
sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib' >> /etc/apt/sources.list.d/virtualbox.list"
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

# Dropbox
sudo sh -c "echo 'deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) contrib' >> /etc/apt/sources.list.d/dropbox.list"
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

# PlayOnLinux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
# For Ubuntu 14.04 (Trusty version)
sudo wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list


sudo apt-get -y --force-yes update


echo "*************************************************************"


echo "*****    Installing essentials    *****"

# Files compressors
# http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-04-trusty-tahr
sudo apt-get install -y \
    unace \
    rar unrar \
    zip unzip \
    p7zip-full p7zip-rar \
    sharutils uudeview arj cabextract

# Tools
sudo apt-get install -y \
    google-chrome-beta google-talkplugin \
    wine1.7 winetricks playonlinux \
    openjdk-7-jdk icedtea-7-plugin \
    virtualbox virtualbox-guest-additions-iso \
    nautilus-dropbox filezilla \
    unity-tweak-tool \
    xclip curl zsh \
    vlc kdenlive audacity inkscape \
    skype calibre redshift-gtk


echo "*****    Installing development tools    *****"
sudo apt-get install -y git  \
    vim sublime-text-installer \
    typecatcher \
    nodejs python-pip


# http://darrenma.wordpress.com/2012/07/13/installing-pil-into-a-virtualenv-properly-in-ubuntu/
echo "*****    Installing images libs (Pillow python)    *****"
sudo apt-get install -y libjpeg8 libjpeg8-dev \
    libfreetype6 libfreetype6-dev \
    zlib1g zlib1g-dev


echo "*****    Removing unnecessary apps    *****"
sudo apt-get purge -y gnome-sudoku gnome-mahjongg gnome-mines aisleriot totem


echo "*************************************************************"


# Python pip packages
echo "*****    Installing pip packages    *****"
sudo pip install virtualenvwrapper


# Node packages
echo "*****    Installing node packages    *****"
sudo npm install yo -g


echo "*************************************************************"


echo "*****    Setting home folders    *****"
rm -rf ~/Documents/ ~/Templates/ ~/Public/ examples.desktop
mkdir -p ~/Code
mkdir -p ~/Dropbox/Documents
ln -s ~/Dropbox/Documents  ~/Documents

echo 'file:///home/jacob/Code Code' >> ~/.config/gtk-3.0/bookmarks
echo 'file:///home/jacob/Dropbox Dropbox' >> ~/.config/gtk-3.0/bookmarks


echo "*****    Autostart Redshift    *****"
wget --no-check-certificate https://raw.githubusercontent.com/jacobparra/laptop-setup/master/redshift-gtk.desktop -O ~/.config/autostart/redshift-gtk.desktop


echo "*************************************************************"


# http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html
echo "*****    Setting Solarized Dark in terminal    *****"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
./gnome-terminal-colors-solarized/set_dark.sh
rm -rf gnome-terminal-colors-solarized

# Install dotfiles
echo "*****    Cloning dotfiles    *****"
rm -rf ~/.dotfiles
git clone https://github.com/jacobparra/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
cd


echo "*************************************************************"


echo "*****    Installing ubuntu-restricted-extras    *****"
# requires clicks
sudo apt-get install -y ubuntu-restricted-extras

# http://www.webupd8.org/2014/04/10-things-to-do-after-installing-ubuntu.html
echo "*****    Installing extra media codecs    *****"
sudo apt-get install -y libavcodec-extra
sudo apt-get install -y libdvdread4 
sudo /usr/share/doc/libdvdread4/install-css.sh


echo "*************************************************************"

echo "*****    Cleaning Up    *****"
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean


echo "*************************************************************"


echo "*****    Creating SSH key    *****"
ssh-keygen -t rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "*****    Go to https://github.com/settings/ssh to paste it!    *****"


echo "*************************************************************"
echo "*****                      DONE!!!                      *****"
echo "*************************************************************"