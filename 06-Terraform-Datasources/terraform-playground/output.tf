# Lets have fun on Linux!

# Define output variables
output "file_content" {
  description = "file content from resource"
  value = local_file.pet.content
}

output "file_content_from_data" {
  description = "file content from data source"
  value = data.local_file.pet_data.content
}