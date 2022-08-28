#!/bin/sh
clear
echo "If you ran this installer without root access, please press CTRL+C to stop this installer and add SUDO at the beginning before continuing with the installation."
echo ""
echo "Welcome to LightNexus! This is made specifically for Core 2 Duo era of PCs with 2GB RAM or more (in other words, older, weaker PCs), where little resource usage is key, yet maintaining a modern look for the UI."
echo ""
read -p "If you're ready to install LightNexus, press ENTER, if not, stop the installer using CTRL+C"
clear
echo "Let's go!"
echo "Checking if your installation needs an update to continue, a restart will be ran at the end."
pacman -Syu --noconfirm
echo "Installing repositories for LightNexus to function, please wait."
# Thanks to https://aur.chaotic.cz for providing this repository and giving an easier way to install PAMAC!
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
echo "[multilib-testing]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
# Assuming I didn't tell the user to add multilib in the video, though I don't think pacman will freak out for multiple repeated repos.
echo "Repositories are installed. Now installing: PAMAC App Store"
sudo pacman -Syu --noconfirm pamac-aur
echo "Installing basic applications. Others can be installed later using the PAMAC App Store."
sudo pacman -S --noconfirm vlc chromium libreoffice-fresh yaru-gtk-theme yaru-icon-theme yaru-metacity-theme yaru-sound-theme plank brisk-menu mate-applet-dock mate-netbook mate-menu mate-tweak compiz cutefish-wallpapers gvfs-smb
echo "Installation done!"
echo "Please refer to the link attached below on how to continue the installation of YAY to download extra applications if needed."
read -p "https://github.com/thelegendaryboy64/LightNexus/blob/main/YAYInstallation.md"
exit
