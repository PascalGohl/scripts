#!/bin/bash

# git stuff
sudo apt-get install gitk git-cola -y
git config --global user.email pascal.gohl@gmail.com
git config --global user.name "Pascal Gohl"
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global push.default simple

#enable git subtree on ubuntu
#Git subtree is installed by default on Ubuntu 13.04 and 13.10, but it is not enabled.  To enable it:
sudo chmod +x /usr/share/doc/git/contrib/subtree/git-subtree.sh
sudo ln -s /usr/share/doc/git/contrib/subtree/git-subtree.sh /usr/lib/git-core/git-subtree


# nautilus replacement
sudo add-apt-repository ppa:noobslab/mint
sudo apt-get update
sudo apt-get install nemo nemo-preview nemo-compare nemo-dropbox nemo-fileroller nemo-pastebin nemo-seahorse nemo-share nemo-rabbitvcs nemo-terminal  -y

# nautilus svn/git plugin
sudo add-apt-repository ppa:rabbitvcs/ppa
sudo apt-get update
sudo apt-get install rabbitvcs-nautilus3 -y

# my current used repositories
cd git
git clone ssh://git@drz-git.ethz.ch/vfrv.git
svn co svn+ssh://gohlp@svn.aslforge.ethz.ch/svnroot/dslocalization

# system monitor
sudo apt-get install indicator-multiload -y
indicator-multiload &

# other usefull utilities
sudo apt-get install htop vim openssh-server smbnetfs vlc gtkterm nautilus-open-terminal -y

sudo apt-get install libblas-dev liblapack doxygen autoconf -y

# config unity
sudo apt-get install gconf-editor -y
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/stop_velocity 10
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/overcome_pressure 10
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/reveal_pressure 10

gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2

# turn Ubuntu crash reporting off
sed 's/^enabled=1$/enabled=0/' /etc/default/apport

# setup my ssh keys
mkdir ~/.ssh
chmod 700 ~/.ssh
cp authorized_keys ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
cp id_dsa ~/.ssh/
chmod 600 ~/.ssh/id_dsa

# maltab preparation
sudo ln -s /usr/local/MATLAB/R2012a/bin/matlab /usr/sbin/matlab

#install and build gtest
sudo apt-get install libgtest
cd /usr/src/gtest
sudo cmake .
sudo make
sudo mv libg* /usr/lib/

# install Oracle java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

# eclipse
wget http://mirror.switch.ch/eclipse/technology/epp/downloads/release/luna/SR1/eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
sudo mv eclipse /opt
sudo chown pascal -R /opt/eclipse/
sudo ln -s /opt/eclipse/eclipse /usr/sbin/eclipse
rm eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz
# setup unity link
cat > eclipse.desktop << "EOF"
[Desktop Entry]
Name=Eclipse 
Type=Application
Exec=eclipse
Terminal=false
Icon=eclipse
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse
EOF
sudo mv eclipse.desktop /opt/eclipse/
sudo desktop-file-install /opt/eclipse/eclipse.desktop
sudo cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm

# usefull eclipse plugins
# https://raw.github.com/xgsa/cdt-tests-runner/tests_runner_demo/testsrunner/org.eclipse.cdt.testsrunner-updatesite/site.xml
# http://texlipse.sourceforge.net

# HDD spinn downs
#sudo sh -c "echo "/dev/sda { 
#	spindown_time = 10
#}
#/dev/sdc {
#	spindown_time = 10
#}" >> sudo /etc/hdparm.conf"

# additional latex style sheets
sudo apt-get install texlive-latex-recommended texlive-latex-extra -y

sudo apt-get install terminator -y
# set terminator as default terminal for gnome shortcut
gsettings set org.gnome.desktop.default-applications.terminal exec /usr/bin/terminator

