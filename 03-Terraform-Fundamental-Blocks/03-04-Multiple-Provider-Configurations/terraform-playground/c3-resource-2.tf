resource "local_file" "file_b" {
  provider = local.b
  content  = "This file is created by saleh using provider B"
  filename = "file_b.txt"
}