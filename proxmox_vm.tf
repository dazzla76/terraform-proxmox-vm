resource "random_integer" "vm_id" {
    min     = 1000
    max     = 9999
    count   = var.vm_count
}

resource "proxmox_vm_qemu" "virtual_machine" {
  count           = var.vm_count
  name            = "${var.name_prefix}${count.index + 1}"
  target_node     = var.target_node
  vmid            = "${random_integer.vm_id[count.index].result}"
  clone           = var.template
  agent           = 1
  os_type         = "cloud-init"
  qemu_os         = "other"
  cores           = var.cores
  sockets         = var.sockets
  cpu             = "host"
  memory          = var.memory
  scsihw          = "virtio-scsi-pci"
  bootdisk        = "scsi0"
  ipconfig0       = "ip=${var.ip_range[count.index]}/24,gw=${var.nameserver}"
  nameserver      = var.nameserver
  ssh_user        = var.ssh_user
  ssh_private_key = var.ssh_private_key
  sshkeys         = var.ssh_public_key

  disk {
    slot      = 0
    size      = var.disk_size
    type      = "scsi"
    storage   = "local-lvm"
    iothread  = 1
  }
  network {
    model     = "virtio"
    bridge    = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  connection {
    type        = "ssh"
    user        = self.ssh_user
    private_key = self.ssh_private_key
    host        = self.ssh_host
    port        = self.ssh_port
  }
  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${var.name_prefix}${count.index + 1}",
      "sudo reboot"
      ]
  }
}

