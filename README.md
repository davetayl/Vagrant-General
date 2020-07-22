# Vagrant-General
General scripts for use with Vagrant that run some basic checks and update the OS etc

## Usage
They are used in your vagrantfile the same way you would use a local shell script.

config.vm.provision "shell", path: "https://github.com/davetayl/Vagrant-General/raw/master/setup-centos8.sh"
