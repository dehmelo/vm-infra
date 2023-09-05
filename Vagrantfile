# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = {
  'debian' => {'memory' => '1024', 'cpus' => 1, 'ip' => '110', 'box' => 'debian/bullseye64', 'provision' => 'debian.sh'},
  'alma' => {'memory' => '1024', 'cpus' => 1, 'ip' => '220', 'box' => 'almalinux/8', 'provision' => 'alma.sh'},
}

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  vms.each do |name, conf|
    config.vm.define "#{name}" do |a|
      a.vm.box = "#{conf['box']}"
      a.vm.network 'private_network', ip: "192.168.57.#{conf['ip']}"
      a.vm.hostname = "#{name}"
      a.vm.disk :disk, name: "iscsi", size: "20GB"
      a.vm.provider 'virtualbox' do |vb|
        vb.customize ["modifyvm", :id, "--groups", "/Linux"]
        vb.memory = conf['memory']
        vb.cpus = conf['cpus']
        vb.name = "#{name}"
      end
      a.vm.provision 'shell', path: "provision/#{conf['provision']}", args: "#{conf['ip']}"
    end
  end
end
