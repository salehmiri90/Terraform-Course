# Lets have fun on Linux!

# Define output variables
output "file_path" {
  description = "file path on os"
  value = local_file.pet.filename
}

output "pet_id" {
  description = "file path on os"
  value = random_pet.my-pet.id
}