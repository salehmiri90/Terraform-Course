# Lets have fun on Linux!

resource "local_file" "pet" {
  filename = var.filename
  content  = var.content
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}

data "local_file" "pet_data" {
  filename = local_file.pet.filename
}
