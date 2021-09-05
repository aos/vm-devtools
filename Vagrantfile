Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "libvirt" do |vb|
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.limit = "all"
    ansible.playbook = "main.yml"
    ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
  end
end
