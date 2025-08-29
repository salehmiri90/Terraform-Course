resource "local_file" "output_file" {
  filename = "./${var.vm_name}/output.txt"
  content  = <<EOF
The VM is powered ${vsphere_virtual_machine.saleh_vm.power_state}
EOF
}
