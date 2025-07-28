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

variable "filename" {
  default = [
    "/root/pets.txt",
    "/root/cats.txt",
    "/root/dogs.txt"
  ]
}

# resource block
resource "local_file" "saleh" {
  count = 3
  filename = var.filename[count.index]
  content  = "This is file number ${count.index}"
}