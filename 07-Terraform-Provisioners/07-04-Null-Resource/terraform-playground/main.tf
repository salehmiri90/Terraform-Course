resource "null_resource" "copy_file" {
  connection {
    type     = "ssh"
    host     = var.server_b_ip
    user     = var.ssh_user
    password = var.ssh_password
  }

  # Transfer file
  provisioner "file" {
    source      = "sample.txt"
    destination = "/tmp/sample.txt"
  }
}

output "status" {
  value = "File copied to ${var.server_b_ip}"
}