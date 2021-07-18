## vm-tools

This repo (will) contain various tools for working with and in VMs.

Currently, it has an Ansible playbook + Vagrantfile to bring up a Rust
development environment with `rust-analyzer` and NVIM 0.5 with LSP integration.

### Vagrantfile

The Vagrant VM works using `libvirt`, so you will need to install the libvirt
plugin and its dependencies:

```
sudo apt install qemu libvirt-daemon-system libvirt-clients ebtables dnsmasq
sudo apt install libguestfs-tools

vagrant plugin install vagrant-libvirt
```
