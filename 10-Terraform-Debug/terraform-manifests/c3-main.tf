# Module Block

module "saleh_vm" {
  source           = "modules/vcenter_vm"
  vm_name          = var.vm_name
  num_cpus         = var.num_cpus
  memory           = var.memory
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  guest_id         = "otherGuest"
  network_id       = data.vsphere_network.network.id
  adapter_type     = "vmxnet3"
  vm_size          = var.vm_size
  eagerly_scrub    = var.eagerly_scrub
  thin_provisioned = var.thin_provisioned
}