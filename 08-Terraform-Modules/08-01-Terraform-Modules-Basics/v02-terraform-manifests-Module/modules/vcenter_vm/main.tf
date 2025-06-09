# Resource Block
resource "vsphere_virtual_machine" "saleh_vm" {
  name     = var.vm_name
  num_cpus = var.num_cpus
  memory   = var.memory

  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  guest_id         = var.guest_id

  network_interface {
    network_id   = var.network_id
    adapter_type = var.adapter_type
  }

  disk {
    label            = "${var.vm_name}-disk0"
    size             = var.vm_size
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
  }
  wait_for_guest_net_timeout  = 0
  wait_for_guest_net_routable = false
  wait_for_guest_ip_timeout   = 0
}