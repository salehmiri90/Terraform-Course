# Task for Home

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "= 3.7.2"
    }
    local = {
      source = "hashicorp/local"
      version = "= 2.5.3"
    }
  }
}
# variables block
// first apply with below and check the result.
variable "filename" {
  default = "/root/pet_name.txt"
}

# resource block
resource "local_file" "saleh" {
  count = 3
  filename = var.filename
  content  = "This is file number ${count.index}"
}