# VMs para Infra

### Requisitos:

Será necessário instalar [Vagrant](https://www.vagrantup.com/) e o [VirtualBox](https://www.virtualbox.org/), para utilizar o repositório para o provisionamento das máquinas.

Também poderá ser instalado o [git](https://git-scm.com/), para realizar o clone do repositório a partir de seu terminal, para usuários de Windows recomendo [https://gitforwindows.org/](https://gitforwindows.org/). Outra opção: [Chocolatey Community](https://community.chocolatey.org/)

Nome            | vCPUs | Memoria RAM | IP             | S.O.         
----------------|:-----:|:-----------:|:--------------:|:---------------:
srv-debian   | 1     | 1024MB      | 192.168.57.110 | debian/bullseye64
srv-alma     | 1     | 1024MB      | 192.168.57.220 | almalinux/8

Após as instalações das ferramentas, através do **Vagrant** será criada as máquinas virtuais no **VirtualBox** de forma automatizada, seguindo as instruções das configurações no Vagrantfile. O **Vagrant** é utilizado para criar e gerenciar as máquinas de uma maneira simples e automática.

Clone o repositório em algum diretório da sua máquina e inicie as vms:

```bash
git clone https://github.com/dehmelo/vm-infra.git
cd vm-infra
vagrant up
```

Ao iniciar as VMs, caso queira utilizar um disco secundário deverá executar o comando abaixo, pois este recurso é experimental e deve ser habilitar de forma manual para uso, através da variável de ambiente:`VAGRANT_EXPERIMENTAL="disks`
```
VAGRANT_EXPERIMENTAL="disks" vagrant up
```

As máquinas serão provisionadas, este processo leva alguns minutos e depende da sua velocidade de conexão com a internet.

### Comandos Principais:

Para listar as máquinas:

```bash
vagrant status
```

Para entrar em uma máquina:

```bash
vagrant ssh srv-debian
```

Para iniciar as máquinas:

```bash
vagrant up
```

Para iniciar somente uma máquina:

```bash
vagrant up srv-alma
```

Para desligar as máquinas:

```bash
vagrant halt
```

Para deletar uma máquina:

```bash
vagrant destroy srv-alma
```

