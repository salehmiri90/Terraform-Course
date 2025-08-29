# Input Variables
variable "vm_name" {
  description = "the name of virtual machine"
  type        = string
  sensitive   = true
}

variable "vm_cpu" {
  description = "cpu core counts"
  type        = number
}

variable "vm_ram" {
  description = "ram value based on MegaBytes"
  type        = number
}

variable "vcenter_pass" {
  description = "the password for vcenter gui"
  type        = string
}