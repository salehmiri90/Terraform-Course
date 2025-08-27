# Lets have fun on Linux!

# variable block
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