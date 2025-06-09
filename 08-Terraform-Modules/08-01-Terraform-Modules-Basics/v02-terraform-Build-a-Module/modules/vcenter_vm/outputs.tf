# Define output variables
output "vm_state" {
  description = "The current state of the VM"
  value       = vsphere_virtual_machine.vcenter_vm.power_state
}

output "vm_id" {
  description = "The ID of the VM"
  value       = vsphere_virtual_machine.vcenter_vm.id
  sensitive   = true
}