#!/usr/bin/env bash

# colors
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'


USERNAME="salan"
HOMEDIR=/home/salan
CONFIGDIR=$HOMEDIR/git/configs
REPODIR=$CONFIGDIR/vimrc-config-master

DISTRO_LIST=("arch" "manjaro" "debian" "raspbian" "ubuntu" "lubuntu" "xubuntu" "kubuntu" "gentoo" "redcore" "rhel" "centos" "fedora" "opensuse" "suse")
DISTRO=$(grep "^ID=.*$" /etc/os-release | sed 's/^[^=]*=//')

BASIC_PACKAGES="vim nano git htop sudo make tmux terminator zsh curl wget unzip openssh"
ADVANCED_PACKAGES="tcpdump nmap netcat net-tools ufw g++"

# check if user is root - has PID 0
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}ERROR: script isn't run by root"
    exit 1;
fi

# check internet connection
if [[ $(nc -zw1 8.8.4.4 443;echo $?) -ne 0 ]]; then
    echo -e "${RED}ERROR: there is no internet connection"
    exit 1;
fi

# identify package manager
if [[ " ${DISTRO_LIST[*]} " =~ " ${DISTRO} " ]]; then
    index=$(echo ${DISTRO_LIST[@]/${DISTRO}//} | cut -d/ -f1 | wc -w | tr -d ' ')
    if [ $index  -ge 0 ] && [ $index -le 1 ]; then
        pkg_mngr="pacman"
        update_cmd="-Syy"
        install_cmd="-S --noconfirm"
    elif [ $index  -ge 2 ] && [ $index -le 7 ]; then
        pkg_mngr="apt-get"
        update_cmd="update"
        install_cmd="install --yes"
    elif [ $index  -ge 8 ] && [ $index -le 9 ]; then
        pkg_mngr="emerge"
        update_cmd="-DuN world"
        install_cmd=""
    elif [ $index  -ge 10 ] && [ $index -le 12 ]; then
        pkg_mngr="yum"
        update_cmd="update"
        install_cmd="install -y"
    elif [ $index  -ge 13 ] && [ $index -le 14 ]; then
        pkg_mngr="zypper"
        update_cmd="update"
        install_cmd="install –-non-interactive"
    fi
else
    echo -e "${YELLOW}WARN: package manager not found for ${CYAN}${DISTRO}${YELLOW} distribution${NC}"
    read -p "Enter package manager name: " pkg_mngr
    read -p "Enter command option to update packages (e.g. update/-Syy): " update_cmd
    read -p "Enter command option to install package without confirmation (e.g. install --yes/-S --noconfirm): " install_cmd
fi

# install essential packages
if $pkg_mngr $update_cmd 2> /dev/shm/update.log 1>/dev/null; then
    echo -e "${CYAN}INFO: installing essential packages...${NC}"
    $pkg_mngr $install_cmd $BASIC_PACKAGES &>/dev/null
    echo -e "${CYAN}INFO: finished installing packages${NC}"
    echo -e "${CYAN}INFO: please verify if all of them are installed (you can find them somewhere in the /var/cache/$pkg_mngr/)${NC}"
else
    echo -e "${RED}ERROR: couldn't update packages:${NC}\n" && cat /dev/shm/update.log
    exit 1;
fi

# user stuff
useradd --create-home --shell /usr/bin/zsh  --uid 2137 $USERNAME &>/dev/null
if [[ $? -eq 0 ]]; then 
    echo -e "${CYAN}INFO: user ${USERNAME} added successfully${NC}"
    echo "${USERNAME}  ALL=(ALL:ALL) ALL" >> /etc/sudoers
    if [[ $? -eq 0 ]]; then
        echo -e "${CYAN}INFO: user added to sudoers${NC}"
    else
        echo -e "${YELLOW}WARN: couldn't add user to sudoers${NC}"
    fi
else
    echo -e "${RED}ERROR: problem with creating user"
    exit 1;
fi

#clone vim package manager -- Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOMEDIR/.vim/bundle/Vundle.vim &>/dev/null

# download configuration files from GitHub and copy stuff
wget --directory-prefix=$HOMEDIR https://github.com/El-Patron-Salan/vimrc-config/archive/refs/heads/master.zip &>/dev/null
mkdir -p $CONFIGDIR && unzip $HOMEDIR/master.zip -d $CONFIGDIR &> /dev/null
\cp $REPODIR/.vimrc /home/salan/
rm $HOMEDIR/master.zip

# install oh-my-zsh
su - salan -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended' &>/dev/null
echo -e "${CYAN}INFO: Installed oh-my-zsh${NC}"
\cp $REPODIR/candy.zsh-theme $HOMEDIR/.oh-my-zsh/themes/
\cp $REPODIR/.zshrc /home/salan/

# should be advanced packages installed?
read -p "Proceed with advanced packages installation? [Y/n] " opt
case $opt in
    y*|Y*|"") $pkg_mngr $install_cmd $ADVANCED_PACKAGES &>/dev/null ;;
    n*|N*) echo "" ;;
    *) echo -e "${YELLOW}WARN: Invalid option. Skipping...${NC}" ;;
esac

echo -e "${CYAN}INFO: Setting environment complete :)${NC}"
