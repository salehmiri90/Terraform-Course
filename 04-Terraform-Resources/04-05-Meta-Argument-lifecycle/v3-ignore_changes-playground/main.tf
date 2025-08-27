# Lets have fun on Linux!

// run this code first
resource "local_file" "pet" {
  filename = "v3-pets.txt"
  content = "We love pets!"
  file_permission = "0700"
  
  // then try to change content and run again
  lifecycle {
    ignore_changes = [ 
      content
     ]
  }
}