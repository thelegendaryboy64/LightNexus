# Why is this not part of the installer itself?
It's only because of makepkg. Makepkg doesn't allow running as root and I failed to get it to work from my own testing.

# Installing YAY
This process is very easy as it requires only 5 commands in order to install YAY. Fire up your terminal and let's begin! Steps are going to be placed in their correct order, so copy, paste and execute commands from top to bottom.

    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm
    cd && rm -rf yay

After this, YAY should function and you can begin installing applications like so:

    yay minecraft-launcher
