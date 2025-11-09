output "nic_ids" {
  value = [for n in azurerm_network_interface.nic : n.id]
}
