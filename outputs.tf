output "host_ips" {
  value = {
    for vm in proxmox_vm_qemu.virtual_machine : vm.name => vm.ssh_host

  }
}
