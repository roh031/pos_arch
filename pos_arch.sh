#!/usr/bin/env bash
echo "Pós instalação Arch Linux + XFCE"
sleep 2
#
# Configurar o teclado
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "FONT=lat0-16" >> /etc/vconsole.conf
#
# Adicionar seu usuário
echo "Criando usuário tux"
sleep 2
useradd -m -g users -G wheel,storage,video,audio,power,optical,network -s /bin/bash tux
#
# Colocar a senha
echo "Adicionado senha ao usuário tux"
sleep 2
passwd tux
#
# Instalar o sudo
echo "Instalando sudo"
sleep 2
pacman -S sudo --noconfirm
#
# Instalar o servidor gráfico
echo "Instalando servidor gráfico X.org"
sleep 2
pacman -S xorg xorg-xinit xf86-video-vesa xf86-video-fbdev virtualbox-guest-utils ttf-dejavu gvfs-mtp  --noconfirm
#
# Instalar o suporte ao audio
echo "Instalando drive de áudio"
sleep 2
pacman -S alsa-lib alsa-utils alsa-firmware alsa-plugins pulseaudio-alsa pulseaudio paprefs  --noconfirm
#
# Instalar compactadores/descompactadores
echo "Instalando compactadores"
sleep 2
pacman -S tar file-roller unzip unrar p7zip --noconfirm
#
# Suporte a ntfs e servidor SSH
echo "Instalando servidor OpenSSH e suporte ao NTFS"
sleep 2
pacman -S ntfs-3g openssh sshfs   --noconfirm 
#
# Suporte ao GIT 
echo "Instalando GIT, CURL e wget"
sleep 2
pacman -S git wget curl  --noconfirm
#
# Instalar o XFCE4
echo "Instalando a interface gráfica XFCE"
sleep 2
pacman -S xfce4 xfce4-goodies  --noconfirm 
#
# Instalar Lightdm 
echo "Instalando gerenciador de login"
sleep 2
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings   --noconfirm 

# Criar o arquivo XINITRC
echo "exec startxfce4" >> /home/ronaldo/.xinitrc
chown ronaldo /home/romaldo/.xinitrc
chgrp ronaldo /home/ronaldo/.xinitrc 
chmod 644 /home/ronaldo/.xinitrc

# Instalar utilitários
echo "Instalando vários utilitários"
sleep 2
pacman -S  dcfldd wipe testdisk foremost smbclient samba neofetch clamav  scrot ddrescue dvd+rw-tools htop gparted uget --noconfirm
pacman -S transmission-qt gftp firefox firefox-i18n-pt-br  chromium  evince devede brasero libreoffice gthumb --noconfirm
pacman -S audacious vlc papirus-icon-theme moka-icon-theme audacity  systemd-swap emelfm2 moc feh simplescreenrecorder --noconfirm 
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

