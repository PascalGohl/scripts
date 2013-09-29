#!/bin/bash

# git stuff
sudo apt-get install gitk git-cola -y
git config --global user.email pascal.gohl@gmail.com
git config --global user.name "Pascal Gohl"
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

# nautilus svn/git plugin
sudo add-apt-repository ppa:rabbitvcs/ppa
sudo apt-get update
sudo apt-get install rabbitvcs-nautilus3 -y

# my current used repositories
git clone ssh://git@drz-git.ethz.ch/vfrv.git
svn co svn+ssh://gohlp@svn.aslforge.ethz.ch/svnroot/dslocalization

# system monitor
sudo add-apt-repository ppa:indicator-multiload/stable-daily -y
sudo apt-get update
sudo apt-get install indicator-multiload -y
indicator-multiload &

# other usefull utilities
sudo apt-get install htop vim openssh-server smbnetfs vlc gtkterm -y

# config unity
sudo apt-get install gconf-editor -y
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/stop_velocity 10
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/overcome_pressure 10
gconftool-2 -t int -s /apps/compiz-1/plugins/unityshell/screen0/options/reveal_pressure 10

# setup my ssh keys
mkdir ~/.ssh
chmod 700 ~/.ssh
cp authorized_keys ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
cp id_dsa ~/.ssh/
chmod 600 ~/.ssh/id_dsa

# maltab preparation
sudo ln -s /usr/local/MATLAB/R2012a/bin/matlab /usr/sbin/matlab

# eclipse
wget http://mirror.switch.ch/eclipse/technology/epp/downloads/release/kepler/R/eclipse-cpp-kepler-R-linux-gtk-x86_64.tar.gz
tar -zxvf eclipse-cpp-kepler-R-linux-gtk-x86_64.tar.gz
sudo mv eclipse /opt
sudo chown pascal -R /opt/eclipse/
sudo ln -s /opt/eclipse/eclipse /usr/sbin/eclipse
rm eclipse-cpp-kepler-R-linux-gtk-x86_64.tar.gz
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


