# Lets have fun on Linux!

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