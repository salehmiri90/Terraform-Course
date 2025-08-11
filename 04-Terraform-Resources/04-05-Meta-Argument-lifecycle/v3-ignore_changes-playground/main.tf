// run this code first
resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
  file_permission = "0700"
  
  // then try to change content and run again
  lifecycle {
    ignore_changes = [ 
      content
     ]
  }
}