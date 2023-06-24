# Proxmox Virtual Machine

This Terraform module provisions a group of 1 or more proxmox virtual machines

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="vm_count"></a> [vm_count](#vm\_count) | The number of VM's required | `integer` | 1 | no |
| <a name="template"></a> [template](#template) | The VM template to use| `string` | null | yes |
| <a name="target_node"></a> [target_node](#target\_node) | The proxmox node to start the VM on| `string` | pve | no |
| <a name="template"></a> [template](#template) | The VM template to use| `string` | null | yes |
| <a name="ssh_public_key"></a> [ssh_public_key](#ssh\_public\_key) | ssh public key for post provisioning automation| `string` | null | yes |
| <a name="ssh_private_key"></a> [ssh_private_key](#ssh\_private\_key) | ssh private key for post provisioning automation| `string` | null | yes |
| <a name="ssh_user"></a> [ssh_user](#ssh\_user) |user to use for post provisioning automation| `string` | null | yes |
| <a name="nameserver"></a> [nameserver](#nameserver) | DNS server to configure the host with| `string` | 192.168.1.1 | no |
| <a name="name_prefix"></a> [name_prefix](#name\_prefix) | Prefix for hostname and vm name, will be appended with integer identifier| `string` | host | no |
| <a name="cores"></a> [cores](#cores) | Number of CPU cores for each VM| `integer` | null | yes |
| <a name="disk_size"></a> [disk_size](#disk\_size) | Size of root disk for each VM| `string` | 15G | no |
| <a name="sockets"></a> [sockets](#sockets) |Number of sockets to assign to each VM| `integer` | 1 | no |
| <a name="memory"></a> [memory](#memory) | Amount of memory to assign to each VM in Mb| `integer` | 2048 | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_addresses"></a> [host_addresses](#output\_ip\_addresses) | Dictionary of hostname and ip addresses. |
<!-- END_TF_DOCS -->