#!/bin/bash
echo "Pós instalação Arch Linux + XFCE"
sleep 5

# Configurar o teclado
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf


# Adicionar seu usuário
useradd -m -g users -G wheel,storage,video,audio,power,optical,network -s /bin/bash ronaldo

# Colocar a senha
passwd ronaldo

# Instalar o sudo
pacman -S sudo

# Instalar o servidor gráfico
pacman -S xorg xorg-xinit xf86-video-vesa xf86-video-fbdev virtualbox-guest-utils ttf-dejavu gvfs-mtp 

# Instalar o suporte ao audio
pacman -S alsa-lib alsa-utils alsa-firmware alsa-plugins pulseaudio-alsa pulseaudio paprefs 

# Instalar compactadores/descompactadores
pacman -S tar gzip bzip2 unzip unrar p7zip

# Suporte a ntfs e servidor SSH
pacman -S ntfs-3g 

# Suporte ao GIT 
pacman -S git wget curl openssh

# Instalar o KDE Plasma 5.15
pacman -S xfce4 xfce4-goodies 

# Instalar Lightdm 
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings  --noconfirm 

# Criar o arquivo XINITRC
echo "exec startxfce4" >> /home/ronaldo/.xinitrc
chown ronaldo /home/romaldo/.xinitrc
chgrp ronaldo /home/ronaldo/.xinitrc 
chmod 644 /home/ronaldo/.xinitrc

# Instalar utilitários
pacman -S wipe dcfldd testdisk foremost smbclient samba neofetch clamav  scrot ddrescue dvd+rw-tools htop gparted uget transmission-qt gftp firefox firefox-i18n-pt-br  chromium  evince brasero libreoffice gthumb audacious vlc papirus-icon-theme

# Habilitar a tela de login
systemctl enable lightdm

# Habilitar o servidor SSH

systemctl enable sshd.service 

#Habilitar o gerenciamento da rede

systemctl enable NetworkManager

#Reiniciar
echo "Bye, bye, American Pie"
sleep 5
reboot

