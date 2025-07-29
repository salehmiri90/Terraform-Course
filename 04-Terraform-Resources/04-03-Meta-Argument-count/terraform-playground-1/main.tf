# Task for Home

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.5.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.7.0"
    }
  }
}
# variables block
// first apply with below and check the result.
variable "filename" {
  default = "playground-04-03-pets.txt"
}

# resource block
resource "local_file" "saleh" {
  count = 3
  filename = var.filename
  content  = "This is file number ${count.index}"
}
// check the output file name by openning it and see what is the number insde of file