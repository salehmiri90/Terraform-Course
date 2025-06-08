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

###  Info for create VM ###
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "num_cpus" {
  description = "The number of CPUs"
  type        = number
}

variable "memory" {
  description = "Memory size in GB"
  type        = number
}