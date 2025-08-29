# Lets have fun on Linux!

# Define advance output variables
resource "local_file" "output_file" {
  filename = "${var.prefix}-${var.filename}.txt"
  content  = <<EOF
The content of ${var.filename} is ${var.content}
EOF
}