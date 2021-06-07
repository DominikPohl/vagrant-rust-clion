# ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
    config.vm.provision "shell", path: "bootstrap.sh"
	
	config.vm.define "vagrant-rust" do |node|
		node.vm.box = "debian/bullseye64"
		node.vm.hostname = "vagrant-rust"
		node.vm.network "private_network", ip: "172.16.17.2"
		node.vm.provider "virtualbox" do |v|
			v.name = "[Vagrant] Rust"
			v.cpus = 6
			v.memory = 4096
		end
	end
end