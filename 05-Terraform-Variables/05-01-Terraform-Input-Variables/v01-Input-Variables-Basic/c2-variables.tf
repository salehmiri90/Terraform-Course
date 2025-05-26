# Input Variables
variable "vm_name" {
  description = "the name of virtual machine"
  type        = string
  default     = "saleh-vm"
}

variable "vm_cpu" {
  description = "cpu core counts"
  type        = number
  default     = 2
}

variable "vm_ram" {
  description = "ram value based on MegaBytes"
  type        = number
  default     = 1024
}
