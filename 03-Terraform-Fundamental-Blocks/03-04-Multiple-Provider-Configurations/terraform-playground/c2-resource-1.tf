resource "local_file" "file_a" {
  provider = local.a
  content  = "This file is created by saleh using provider A"
  filename = "file_a.txt"
}