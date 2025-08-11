output "pet_file_path" {
  value       = module.pets_module.pet_file_path
  description = "Path to the generated pet file from the module"
}

output "random_pet_name" {
  value       = module.pets_module.random_pet_name
  description = "Random pet name generated in the module"
}
