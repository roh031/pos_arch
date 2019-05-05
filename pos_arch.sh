#!/usr/bin/env bash
echo "Pós instalação Arch Linux + XFCE"
sleep 3
#
# Configurar o teclado
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "FONT=lat0-16" >> /etc/vconsole.conf
#
# Adicionar seu usuário
useradd -m -g users -G wheel,storage,video,audio,power,optical,network -s /bin/bash ronaldo
#
# Colocar a senha
passwd ronaldo
#
# Instalar o sudo
pacman -S sudo --noconfirm
#
# Instalar o servidor gráfico
pacman -S xorg xorg-xinit xf86-video-vesa xf86-video-fbdev virtualbox-guest-utils ttf-dejavu gvfs-mtp  --noconfirm
#
# Instalar o suporte ao audio
pacman -S alsa-lib alsa-utils alsa-firmware alsa-plugins pulseaudio-alsa pulseaudio paprefs  --noconfirm
#
# Instalar compactadores/descompactadores
pacman -S tar file-roller gzip bzip2 unzip unrar p7zip --noconfirm
#
# Suporte a ntfs e servidor SSH
pacman -S ntfs-3g  --noconfirm 
#
# Suporte ao GIT 
pacman -S git wget curl openssh sshfs --noconfirm
#
# Instalar o KDE Plasma 5.15
pacman -S xfce4 xfce4-goodies  --noconfirm 
#
# Instalar Lightdm 
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings   --noconfirm 

# Criar o arquivo XINITRC
echo "exec startxfce4" >> /home/ronaldo/.xinitrc
chown ronaldo /home/romaldo/.xinitrc
chgrp ronaldo /home/ronaldo/.xinitrc 
chmod 644 /home/ronaldo/.xinitrc

# Instalar utilitários
pacman -S  dcfldd wipe testdisk foremost smbclient samba neofetch clamav  scrot ddrescue dvd+rw-tools htop gparted uget --noconfirm
pacman -S transmission-qt gftp firefox firefox-i18n-pt-br  chromium  evince devede brasero libreoffice gthumb --noconfirm
pacman -S audacious vlc papirus-icon-theme audacity  systemd-swap emelfm2 moc feh simplescreenrecorder --noconfirm 
pacman -S ffmpeg imagemagick gnome-disk-utility gparted  galculator --noconfirm 
#
# Habilitar a tela de login
systemctl enable lightdm
#
# Habilitar o servidor SSH
#
systemctl enable sshd.service 
#
#Habilitar o gerenciamento da rede
#
systemctl enable NetworkManager
#
#Reiniciar
echo "Bye, bye!"
sleep 5
reboot

