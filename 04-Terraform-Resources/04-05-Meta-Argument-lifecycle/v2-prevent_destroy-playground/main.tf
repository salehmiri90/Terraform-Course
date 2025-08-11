// run this code first
resource "local_file" "pet" {
  filename = "v2-pets.txt"
  content = "We love pets!"
  file_permission = "0700"
  
  // try to change this file or destroy after creation
  lifecycle {
    prevent_destroy = true
  }
}