#!/bin/bash

# rpm fusion

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf -y update

## hardware accel

sudo dnf install -y intel-media-driver

## full ffmpeg

sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# setting umask to 077
umask 077
sudo sed -i 's/umask 022/umask 077/g' /etc/bashrc

# debloat

sudo dnf remove -y firefox gnome-calculator gnome-calendar gnome-characters gnome-classic-session gnome-clocks gnome-connections gnome-contacts gnome-initial-setup gnome-shell-extension-apps-menu gnome-shell-extension-background-logo gnome-shell-extension-common gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu gnome-shell-extension-window-list gnome-video-effects gnome-weather @libreoffice

# flatpak config

flatpak remote-delete fedora
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --noninteractive -y org.mozilla.firefox org.mozilla.Thunderbird com.getpostman.Postman com.github.IsmaelMartinez.teams_for_linux com.mattjakeman.ExtensionManager io.bassi.Amberol io.github.celluloid_player.Celluloid net.nokyan.Resources org.gimp.GIMP org.gtk.Gtk3theme.adw-gtk3-dark org.libreoffice.LibreOffice com.github.tchx84.Flatseal com.microsoft.Edge org.gnome.Calculator org.gnome.Calendar org.gnome.Characters org.gnome.Evince org.gnome.Extensions org.gnome.Loupe org.gnome.Weather com.valvesoftware.Steam com.github.finefindus.eyedropper

# install packages

sudo dnf install -y neovim alacritty tmux adw-gtk3-theme firewall-config @virtualization steam-devices @development-tools stow

# fonts

firacode_url = $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep "browser_download_url.*FiraCode.zip" | cut -d : -f 2,3 | tr -d \")

mkdir -p ~/.local/share/fonts

curl -sL https://github.com/rsms/inter/releases/download/v4.0/Inter-4.0.zip -o /tmp/Inter.zip
unzip /tmp/Inter.zip -d /tmp/Inter
cp /tmp/Inter/Inter.ttc ~/.local/share/fonts
cp /tmp/Inter/*.ttf ~/.local/share/fonts
rm -rf /tmp/Inter*

curl -sL $firacode_url -o /tmp/firacode.zip
unzip /tmp/firacode.zip /tmp/FiraCode
rm /tmp/FiraCode/LICENSE /tmp/FiraCode/README.md
cp -r /tmp/FiraCode ~/.local/share/fonts
rm -rf /tmp/FiraCode

## reload system fonts

fc-cache

# gnome settings

if [ -e ~/.local/share/fonts/Inter ]
then
	gsettings set org.gnome.desktop.interface font-name 'Inter Variable 12' 
	gsettings set org.gnome.desktop.interface document-font-name 'Inter Variable 12' 
fi

if [ -e ~/.local/share/fonts/FiraCode ]
then
	gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Mono 12'
fi

gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds true


# system config

## libvirt
sudo systemctl enable libvirtd
sudo usermod -aG libvirt "$(whoami)"

## change to nts over ntp
sudo curl https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf -o /etc/chrony.conf

## firewall
sudo firewall-cmd --permanent --remove-port=1025-65535/udp
sudo firewall-cmd --permanent --remove-port=1025-65535/tcp
sudo firewall-cmd --permanent --remove-service=mdns
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --permanent --remove-service=samba-client
sudo firewall-cmd --permanent --add-port=631/tcp
sudo firewall-cmd --permanent --add-port=53/tcp
sudo firewall-cmd --permanent --add-port=53/udp
sudo firewall-cmd --permanent --add-port=5353/udp
sudo firewall-cmd --reload

# dotfiles

git clone https://github.com/rafaelsmorais/dotfiles.git ~/dotfiles
stow --no-folding -d ~/dotfiles -t /home/$(whoami) alacritty tmux nvim 
