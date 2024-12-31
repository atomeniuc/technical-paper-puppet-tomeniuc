Vagrant.require_version ">= 1.8.0"

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64" # A lightweight Ubuntu version
    config.vm.hostname = "ubuntu-bionic64"
    config.vm.network "forwarded_port", guest: 80, host:8080 # Maps port 8080 to the guest's port 80
end