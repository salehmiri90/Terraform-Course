# Task for Home

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.5.0"
    }
  }
}

# Variable Block
variable "vm_names" {
  default = [
    "tosetvm-01", 
    "tosetvm-02", 
    "tosetvm-03"
  ]
}

# resource block
resource "local_file" "saleh" {
  for_each = toset(var.vm_names)
  filename = "saleh-${each.key}"
  content  = "Disk capacity for this ${each.value} is 15 GB"
}
// open the created file and check the content carefully