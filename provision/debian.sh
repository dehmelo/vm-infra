#!/bin/bash

#Instalando pacotes
PACOTES="vim vim-common net-tools tzdata curl git"
apt-get update && apt-get upgrade -y
apt-get install -y $PACOTES

#Atualizando horário
timedatectl set-timezone America/Sao_Paulo

#Configurando chaves
mkdir -p /root/.ssh
cp /vagrant/files/id_rsa* /root/.ssh
chmod 400 /root/.ssh/id_rsa*
cp /vagrant/files/id_rsa.pub /root/.ssh/authorized_keys

#Adicionando usuário
id suporte
if [ "$?" -ne 0 ]; then
useradd -m -p '$6$F/96yh0lC8IHK71X$eI29BIG/LFZUd/KZaT2r3XQ/ydvAF31y9ouEry5yPbbDL.pTlWZJDbkF1rf7B8FnQy3mFMq3FOPaDpB8IJ1K20
' -d /home/suporte -s /bin/bash suporte
fi
usermod -aG sudo suporte
echo "suporte ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/suporte

