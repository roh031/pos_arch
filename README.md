# pos_arch.sh
Pós instalação do Arch Linux com interface gráfica XFCE
Faça o downlaod do script e então dê permissão usando a seguinte linha de comando:
sudo chmod +x pos_arch.sh
Logo em seguida execute-o:
bash ./pos_arch.sh

----------------------------------------------------------------------------------
Trago também um modelo de configuraçãoão  do servidor samba para Arch e seus derivados!
Para instalar e usar o Servidor SAMBA, você deve baixá-lo usando a linha de comando:
sudo pacman -S smbclient samba --noconfirm
Depois copie o arquivo "smb.conf" para /etc/samba/
Então crie uma pasta publica no /home:
mkdir -m 775 /home/publico
chgrp users /home/publico
usermod -G nome_do_usuário
Em seguinda, o logo em seguida é um usuário no SAMBA:
smbpasswd -a nome_do_usuário
Em seguida ative o serviço:
systemctl enable smb.service
systemctl restart smb.service!
