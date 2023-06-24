variable "ssh_key" {
  default = ""
}

variable "vm_count" {
  default = 1
}
variable "template" {
  default = "docker"
}

variable "ip_range" {
  default = ""
}

variable "ssh_public_key" {
  default = ""
}
variable "ssh_private_key" {
  default = ""
}
variable "ssh_user" {
  default = "darren"
}

variable "remote_exec" {
  default = []
}
variable "nameserver" {
  default = "10.8.8.10"
}
variable "name_prefix" {
  default = "host"
}
variable "disk_size" {
  default = "15G"
}
variable "cores" {
  default = 1
}
variable "sockets" {
  default = 1
}
variable "memory" {
  default = 2048
}

variable "target_node" {
  default = "pve"
}

