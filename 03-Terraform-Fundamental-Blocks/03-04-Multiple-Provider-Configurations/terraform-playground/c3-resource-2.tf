resource "local_file" "file_b" {
  provider = local.b
  content  = "This file is created by provider B"
  filename = "file_b.txt"
}