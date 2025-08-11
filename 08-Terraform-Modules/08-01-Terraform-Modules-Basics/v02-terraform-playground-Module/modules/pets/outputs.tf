output "pet_file_path" {
  value       = local_file.pet.filename
  description = "Path to the generated pet file"
}

output "random_pet_name" {
  value       = random_pet.my-pet.id
  description = "The generated pet name"
}
