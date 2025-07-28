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
# resource block
provider "random" {}

resource "random_pet" "mypet" {
  length    = 2
  separator = "-"
}

resource "local_file" "saleh" {
  // When random_pet mypet resource is finished, after that this resource will run
  depends_on = [random_pet.mypet] 

  filename = "playground-04-02-pets.txt"
  content  = "Generated pet name: ${random_pet.mypet.id}"
}