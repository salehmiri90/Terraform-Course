# Input Variables
variable "vm_cpu" {
  description = "cpu core counts"
  type        = number
  default     = 1
}

variable "vm_ram" {
  description = "ram value based on MegaBytes"
  type        = number
  default     = 1024
}

variable "env" {
  description = "Deployment environment (e.g. dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}