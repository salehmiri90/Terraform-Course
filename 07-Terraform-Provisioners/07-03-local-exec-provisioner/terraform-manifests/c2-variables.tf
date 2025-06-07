### Info to connect vCenter ###
variable "vsphere_username" {
  description = "Username for vSphere"
  type        = string
  sensitive   = true
}

variable "vsphere_password" {
  description = "Password for vSphere"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "vSphere server address"
  type        = string
  sensitive   = true
}

### Info about vCenter resources ###

variable "datacenter_name" {
  description = "Name of the vSphere datacenter"
  type        = string
}

variable "datastore_name" {
  description = "Name of the vSphere datastore"
  type        = string
}

variable "network_name" {
  description = "Name of the network to attach the VM"
  type        = string
}

variable "cluster_name" {
  description = "Name of the compute cluster"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone"
  type        = string
}

###  Info for create VM ###
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "num_cpus" {
  description = "The number of CPUs"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory size in GB"
  type        = number
  default     = 2
}

variable "vm_os_hostname" {
  description = "the name of host name to set on the OS"
  type        = string
}

variable "vm_os_domain_name" {
  description = "the name of the VM domain to set on the OS"
  type        = string
}

variable "ipv4_address" {
  description = "Static IP address for the VM"
  type        = string
}

variable "ipv4_netmask" {
  description = "Netmask for the VM's network"
  type        = number
}

variable "ipv4_gateway" {
  description = "Gateway for the VM's network"
  type        = string
}