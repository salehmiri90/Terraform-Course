# Resource Block
# Resource-1: Create new VM
resource "esxi_guest" "vmsalehmiri01" {
  guest_name = "vmsalehmiri01"
  disk_store = "DS_001"
  network_interfaces {
    virtual_network = "VM Network"
  }
}
