#!/bin/bash

#Instalando pacotes
PACOTES="vim net-tools tzdata curl git"
apt-get install -y $PACOTES

#Atualizando horário
timedatectl set-timezone America/Sao_Paulo

#Configurando chaves
mkdir -p /root/.ssh
cp /vagrant/files/id_rsa* /root/.ssh
chmod 400 /root/.ssh/id_rsa*
cp /vagrant/files/id_rsa.pub /root/.ssh/authorized_keys

#Adicionando usuário
useradd -m -d /home/suporte -s /bin/bash suporte

