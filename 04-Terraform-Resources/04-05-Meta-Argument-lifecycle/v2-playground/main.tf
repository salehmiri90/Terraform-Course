// run this code first
resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
  file_permission = "0700"
  
  // try to change this file or destroy after creation
  lifecycle {
    prevent_destroy = true
  }
}