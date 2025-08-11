// run this code first
resource "local_file" "pet" {
  filename = "v1-pets.txt"
  content = "We love pets!"
  file_permission = "0700"
  // then change file permission from 0700 to 0755 and run apply and see result
  #file_permission = "0755"

  lifecycle {
    create_before_destroy = true
  }
}