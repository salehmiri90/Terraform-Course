### Info about vCenter resources ###
variable "resource_pool_id" {
  description = "The resource pool ID"
  type        = string
}

variable "datastore_id" {
  description = "The datastore ID"
  type        = string
}

variable "network_id" {
  description = "Network ID"
  type        = string
}

variable "adapter_type" {
  description = "Type of network adapter"
  type        = string
  default     = "vmxnet3"
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

variable "vm_size" {
  description = "Disk size in GB"
  type        = number
}

variable "guest_id" {
  description = "Guest OS identifier"
  type        = string
}

variable "eagerly_scrub" {
  description = "Set for thick eager-zeroed disk"
  type        = bool
  default     = false
}

variable "thin_provisioned" {
  description = "Whether the disk should be thin provisioned"
  type        = bool
  default     = true
}