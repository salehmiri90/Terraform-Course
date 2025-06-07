# Modify below items
network_name         = "VM_Network"
vm_name              = "saleh-01-ubuntu"
num_cpus             = 8
memory               = 16
vm_os_hostname       = "saleh"
vm_os_domain_name    = "miri.ir"
ipv4_address         = "192.168.1.124"
ipv4_netmask         = 24
ipv4_gateway         = "192.168.1.254"

### Do Not Touch ###
vsphere_username       = "saleh@vsphere.local"
vsphere_password       = "P@$40rd!123"
vsphere_server         = "192.168.1.100"
datacenter_name        = "DC-1"
datastore_name         = "vsanDatastore"
cluster_name           = "Cluster-01"
template_name          = "Ubuntu2204_Template"
ssh_user               = "root"
ssh_pass               = "root"
