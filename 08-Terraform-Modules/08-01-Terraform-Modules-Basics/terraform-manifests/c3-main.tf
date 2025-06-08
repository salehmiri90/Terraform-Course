# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name     = var.vm_name
  num_cpus = var.vm_cpu
  memory   = var.vm_ram

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  guest_id = "otherGuest"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 5
    eagerly_scrub    = false
    thin_provisioned = true
  }
  wait_for_guest_net_timeout  = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout   = 0
}