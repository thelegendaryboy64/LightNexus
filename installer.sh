#!/bin/sh
clear
echo "If you ran this installer without root access, please press CTRL+C to stop this installer and add SUDO at the beginning before continuing with the installation."
echo ""
echo "Version: Beta 5"
echo "Welcome to LightNexus! This is made for older, weaker PCs, where little resource usage is key, yet maintaining a modern look for the UI."
echo ""
read -p "If you're ready to install LightNexus, press ENTER, if not, stop the installer using CTRL+C"
clear
echo "Let's go!"
echo "Checking if your installation needs an update to continue, a restart will be required after the full installation."
pacman -Syu --noconfirm
echo "Installing basic applications. Others can be installed later using the PAMAC App Store."
sudo pacman -S --noconfirm linux-lts-headers neofetch vlc chromium libreoffice-fresh yaru-gtk-theme yaru-icon-theme yaru-metacity-theme yaru-sound-theme plank brisk-menu mate-applet-dock mate-netbook mate-menu mate-tweak compiz cutefish-wallpapers gvfs-smb wine wine-mono vkd3d winetricks bluez blueman ntfs-3g noto-fonts-emoji
sudo pacman -R --noconfirm mate-backgrounds
echo "Enabling Bluetooth support on startup"
sudo systemctl enable bluetooth
echo "Installing a repository for LightNexus, please wait."
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
echo "Installation (Part 1) done!"
echo "Please run (wget https://github.com/thelegendaryboy64/LightNexus/raw/main/installerpart2.sh) without brackets in a separate command window to download the part 2."
echo "The file should be in the home of your user account folder and allow execution in terminal. DO NOT RUN IT WITH SUDO!!"
read -p "Press ENTER to exit."
exit
