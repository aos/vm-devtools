ENV["VAGRANT_DEFAULT_PROVIDER"] = "libvirt"

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :libvirt do |v|
    v.cpus = 2
    v.memory = 2048
    v.machine_virtual_size = 50

    v.usb vendor: "0x2341", product: "0x0042", startupPolicy: "optional" # Arduino UNO
    v.usb vendor: "0x10c4", product: "0xea60", startupPolicy: "optional" # USB-UART bridge
    v.usb vendor: "0x0483", product: "0x572a", startupPolicy: "optional" # STM32F4
    v.usb vendor: "0x0483", product: "0xdf11", startupPolicy: "optional" # STM32F4 DFU
    v.usb vendor: "0x0d28", product: "0x0204", startupPolicy: "optional" # Microbit
  end

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.limit = "all"
    ansible.playbook = "main.yml"
    ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
  end
end
