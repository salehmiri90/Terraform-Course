# Lets have fun on Linux!

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