# Define output variables
output "this_vm_power_state" {
  description = "The current state of the VM"
  value       = module.saleh_vm.vm_state
}

output "this_vm_id" {
  description = "The ID of the VM"
  value       = module.saleh_vm.vm_id
  sensitive   = true
}