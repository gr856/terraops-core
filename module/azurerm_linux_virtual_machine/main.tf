
resource "azurerm_linux_virtual_machine" "Lvm" {
  for_each              = var.linuxvm
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  network_interface_ids = each.value.network_interface_ids

 
  dynamic "os_disk" {
    for_each = [each.value.os_disk]
    content {
      caching              = each.value.os_disk[0].caching
      storage_account_type = each.value.os_disk[0].storage_account_type
    }
  }
  dynamic "source_image_reference" {
    for_each = [each.value.source_image_reference]
    content {
      publisher = each.value.source_image_reference[0].publisher
      offer     = each.value.source_image_reference[0].offer
      sku       = each.value.source_image_reference[0].sku
      version   = each.value.source_image_reference[0].version
    }
  }
}
