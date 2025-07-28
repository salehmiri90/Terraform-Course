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

variable "filename" {
  default = [
    "playground-04-03-pets.txt",
    "playground-04-03-cats.txt",
    "playground-04-03-dogs.txt"
  ]
}

# resource block
resource "local_file" "saleh" {
  count = 3
  filename = var.filename[count.index]
  content  = "This is file number ${count.index}"
}