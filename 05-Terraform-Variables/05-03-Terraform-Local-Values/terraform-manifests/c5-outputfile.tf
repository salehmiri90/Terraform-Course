# Write VM name into a file
resource "local_file" "output_file" {
  filename = "./vm_name.txt"
  content  = <<EOF
The VM name is: ${local.vm_name}
EOF
}