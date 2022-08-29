#!/bin/sh
clear
echo "Welcome to the part 2 of the LightNexus installer! This requires to not allow root access for this installer to function properly. If you had run this script with SUDO, please stop the installer using CTRL+C"
echo "Make sure the this .SH file is stored in your home folder or else it may not behave correctly."
echo ""
read -p "If you're ready to continue, press ENTER to begin the second part of the installation sequence."
clear
echo "Let's go!"
echo "Installing YAY automatically (you may be asked for your password)"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd
rm -rf yay
echo "Changing wallpaper"
gsettings set org.mate.background picture-filename '/usr/share/backgrounds/cutefishos/wallpaper-3.jpg'
gsettings set org.mate.background picture-options 'zoom'
cd .config
mkdir mate
cd mate
# updating wallpapers list
rm -rf backgrounds.xml
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/mate/backgrounds.xml
echo "Enabling Compiz for autostart"
cd
cd .config
rm -rf autostart
mkdir autostart
cd /usr/share/applications
cp compiz.desktop ~/.config/autostart
cd
cd .config
cd autostart
rm -rf compiz.desktop
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/autostart/compiz.desktop
cd
echo "Setting up Compiz animations"
# assuming the folders aren't auto generated
cd .config
rm -rf compiz-1
mkdir compiz-1
cd compiz-1
mkdir compizconfig
cd compizconfig
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/compiz-1/compizconfig/Default.ini
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/compiz-1/compizconfig/config
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/compiz-1/compizconfig/done_upgrades
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/compiz-1/compizconfig/firstrun
cd
echo "Setting up the dock layout"
cd .config
# removing exisiting dock configuration layout to replace it with another
rm -rf plank
mkdir plank
cd plank
mkdir dock1
cd dock1
mkdir launchers
cd launchers
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/caja-browser.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/chromium.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/libreoffice-writer.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/libreoffice-calc.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/libreoffice-impress.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/org.manjaro.pamac.manager.dockitem
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/plank/dock1/launchers/mate-terminal.dockitem
cd
echo "Configuring the desktop"
cd .config
rm -rf dconf
mkdir dconf
cd dconf
wget https://github.com/thelegendaryboy64/LightNexus/raw/main/.config/dconf/user
cd
echo "Installation fully finished! You should reboot your PC now for changes to take effect."
read -p "Press ENTER to exit"
