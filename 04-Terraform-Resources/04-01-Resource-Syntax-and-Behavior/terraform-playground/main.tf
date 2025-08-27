# Lets have fun on Linux!

# resource block
resource "random_pet" "demo1" {
  length = 2
}

resource "local_file" "saleh" {
  content  = "The pet name is ${random_pet.demo1.id}"
  filename = "playground-04-01-pets.txt"
}