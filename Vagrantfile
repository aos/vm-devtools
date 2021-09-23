ENV["VAGRANT_DEFAULT_PROVIDER"] = "libvirt"

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :libvirt do |v|
    v.cpus = 2
    v.memory = 2048

    v.usb vendor: "0x2341", product: "0x0042", startupPolicy: "optional" # Arduino UNO
    v.usb vendor: "0x10c4", product: "0xea60", startupPolicy: "optional" # USB-UART bridge
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.limit = "all"
    ansible.playbook = "main.yml"
    ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
  end
end
