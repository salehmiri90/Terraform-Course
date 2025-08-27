# Lets have fun on Linux!

# resource block
resource "local_file" "saleh" {
  for_each = {
    "vm-a" = 10
    "vm-b" = 20
    "vm-c" = 30
    "vm-d" = 40
    "vm-e" = 50
  }
  filename = "saleh-${each.key}"
  content  = "Disk capacity for this ${each.key} is ${each.value} GB"
}
// open the created file and check the content carefully