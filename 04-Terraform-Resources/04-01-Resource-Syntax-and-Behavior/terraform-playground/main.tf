# Task for Home

# terraform block
terraform {
  required_version = "~> 1.8.0"
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
  }
}
# resource block
resource "random_pet" "demo1" {
  length = 2
}

resource "local_file" "pet" {
  content  = "The pet name is ${random_pet.demo1.id}"
  filename = "/root/pets.txt"
}