#!/usr/bin/env bash

# This script installs all the necessary dev tools to bring up the Ansible +
# Vagrant environment

set -oue pipefail

usage() {
  printf 'This script will install all the necessary tooling to bring up Ansible
and Vagrant. Use --run to immediately start Vagrant afterwards.

Usage: %s [-h | -v | -r]\n' "$0"
}

install_deps() {
  sudo apt install \
    qemu \
    libvirt-daemon-system \
    libvirt-clients \
    ebtables \
    dnsmasq \
    libguestfs-tools \
    ansible \
    vagrant

  vagrant plugin install vagrant-libvirt
}

run() {
  vagrant up
}

main() {
  while getopts ":h:v:r" o; do
    case "${o}" in
      r)
        install_deps
        run
        exit 0
        ;;
      v)
        printf '%s 0.1\n' "$0"
        exit 0
        ;;
      h | *)
        usage
        exit 0
        ;;
    esac
  done

  install_deps
  exit 0
}

main "$@"
