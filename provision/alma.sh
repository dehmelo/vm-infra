#!/bin/bash

#Instalando pacotes
PACOTES="epel-release vim net-tools tzdata curl git"
yum update -y
yum install -y $PACOTES

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
useradd -m -p '$1$E6xrggg7$751GMmhS0/pFKrkhjrO3L0' -d /home/suporte -s /bin/bash suporte
fi
usermod -aG wheel suporte
echo "suporte ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/suporte
