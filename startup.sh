#!/bin/bash

blue='\e[0;34m'
red='\e[0;31m'
NC='\e[0m' # No Color
#font colors:
#Black        0;30     Dark Gray     1;30
#Blue         0;34     Light Blue    1;34
#Green        0;32     Light Green   1;32
#Cyan         0;36     Light Cyan    1;36
#Red          0;31     Light Red     1;31
#Purple       0;35     Light Purple  1;35
#Brown/Orange 0;33     Yellow        1;33
#Light Gray   0;37     White         1;37

if (( $EUID != 0 )); then
    echo
    echo -e  "${red} Please run as root ${NC}"
    echo
    echo -e  "${red} Esse script deve ser executado com sudo: sudo ./startup.sh ${NC}"
    echo
    exit 1
fi


echo -e "${blue} Configurando sistema...${NC}"

sleep 2

#updates/system changes
echo -e "${blue} Upgrade ${NC}"
apt-get -y upgrade
echo -e "${blue} Update ${NC}"
apt-get -y update
echo -e "${blue} Terminal color ${NC}"
sed -i 's/#force/force/g' ~/.bashrc

echo -e "${blue} Instalando softwares...${NC}"

sleep 2

#softwares
echo  -e "${blue} G++ ${NC}"
apt-get -y install g++
echo  -e "${blue} Cmake ${NC}"
apt-get -y install cmake
echo  -e "${blue} Gparted ${NC}"
apt-get -y install gparted
echo  -e "${blue} NTP ${NC}"
apt-get -y install ntp
echo -e "${blue} Gnome-system-tools ${NC}"
apt-get -y install gnome-system-tools
echo -e "${blue} Gedit and Plugins ${NC}"
apt-get -y install gedit && apt-get -y install gedit-plugins
echo -e "${blue} Dropbox ${NC}"
apt-get -y install nautilus-dropbox
echo -e "${blue} Kolour Paint ${NC}"
apt-get -y install kolourpaint4
echo -e "${blue} Git ${NC}"
apt-get -y install git-core
apt-get -y install git-cola
apt-get -y install gitk
echo -e "${blue} Boost ${NC}"
apt-get -y install libboost-all-dev 
echo -e "${blue} SSH Server ${NC}"
apt-get -y install openssh-server 
echo -e "${blue} SSH Client ${NC}"
apt-get -y install openssh-client 
echo -e "${blue} Impresive ${NC}"
apt-get -y install impressive
echo -e "${blue} Armadillo ${NC}"
apt-get -y install r-cran-rcpparmadillo
apt-get -y install libarmadillo-dev
apt-get -y install libarmadillo4
echo -e "${blue} FileZilla ${NC}"
apt-get -y install filezilla
echo -e "${blue} Arduino ${NC}"
apt-get -y install arduino
echo -e "${blue} Retext ${NC}"
apt-get -y install retext
echo -e "${blue} CIFS - mapear rede ${NC}"
apt-get -y install cifs-utils 
echo -e "${blue} Curses.h ${NC}"
apt-get -y install libncurses5-dev
echo -e "${blue} WINE and PlayOnlinux${NC}"
add-apt-repository -y ppa:ubuntu-wine/ppa
apt-get -y install wine1.7-amd64 winetricks
apt-get -y install curl
apt-get -y install p7zip-full
apt-get -y install winbind
apt-get -y install playonlinux
echo -e "${blue} Texlive ${NC}"
apt-get -y install texlive-full
echo -e "${blue} publisher ${NC}"
apt-get -y install texlive-publishers
echo -e "${blue} science ${NC}"
apt-get -y install texlive-science
echo -e "${blue} Latex-Beamer ${NC}"
apt-get -y install latex-beamer
echo -e "${blue} TeX Live: Portuguese ${NC}"
apt-get -y install texlive-lang-portuguese
echo -e "${blue} Texmaker ${NC}"
apt-get -y install texmaker
echo -e "${blue} Xindy ${NC}"
apt-get -y install xindy
echo -e "${blue} cheese ${NC}"
apt-get -y install cheese
echo -e "${blue} v4l ${NC}"
apt-get -y install v4l-utils
echo -e "${blue} Core library dependencies (Robô Jimmy) ${NC}"
apt-get -y install build-essential libjpeg-dev mplayer mplayer-skins

#Python
echo -e "${blue} Python ${NC}"
sleep 1

echo -e "${blue} Python-Numpy ${NC}"
apt-get -y install python-numpy
echo -e "${blue} Python-Scipy ${NC}"
apt-get -y install python-scipy
echo -e "${blue} Python-Scikit-learn ${NC}"
apt-get -y install python-scikits-learn
echo -e "${blue} Python-Sklearn ${NC}"
apt-get -y install python-sklearn
echo -e "${blue} Python-Matplotlib ${NC}"
apt-get -y install python-matplotlib
echo -e "${blue} Python-Pygame ${NC}"
apt-get -y install python-pygame
echo -e "${blue} Python-OpenCV ${NC}"
apt-get -y install python-opencv
echo -e "${blue} Python-PIP ${NC}"
apt-get -y install python-pip
echo -e "${blue} Ipython - notebook ${NC}"
pip install ipython[notebook]


echo -e "${blue} Autoremove ${NC}"
apt-get -y autoremove

apt-get install -f

echo -e "${blue} Update ${NC}"
apt-get -y update

echo -e "${blue} Configuração realizada ${NC}"


