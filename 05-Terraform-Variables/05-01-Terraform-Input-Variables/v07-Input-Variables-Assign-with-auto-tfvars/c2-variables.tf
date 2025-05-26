# Input Variables
variable "vm_name" {
  description = "the name of virtual machine"
  type        = string
}

variable "vm_cpu" {
  description = "cpu core counts"
  type        = number
}

variable "vm_ram" {
  description = "ram value based on MegaBytes"
  type        = number
}
