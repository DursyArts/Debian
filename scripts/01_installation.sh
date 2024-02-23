#!/bin/bash

# checking if the Script is being run as root user
if [ "$UID" -ne 0 ]; then
    echo "This script is supposed to be run as root."
    echo "Debian doesnt ship with 'sudo'. This will be configured with this script too.
    exit 1
fi

echo "Script is running as root. good."

apt update
apt upgrade

apt install neofetch
if [ $? -eq 0]; then
    echo "Installed neofetch."
    neofetch
else
    echo "Installation of neofetch failed."
fi

# install zsh and vim
apt install vim && echo "Installed vim."
apt install zsh && echo "Installed zsh."
chsh -s $(which zsh)
zsh --version
echo "To use zsh you have to restart the current user session."


mkdir ~/.local
mkdir ~/.local/share
mkdir ~/.local/share/tldr

apt install tldr man && echo "Installed tldr and man pages."
apt install wget curl && echo "Installed wget and curl."

# Addind a new user
useradd -m -s /bin/zsh leo && echo "Added User 'leo'."