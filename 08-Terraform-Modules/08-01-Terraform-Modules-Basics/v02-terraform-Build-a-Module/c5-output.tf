# Define output variables
output "vm_state" {
  description = "The current state of the VM"
  value       = module.saleh_vm.vm_state
}

output "vm_id" {
  description = "The ID of the VM"
  value       = module.saleh_vm.vm_id
  sensitive   = true
}