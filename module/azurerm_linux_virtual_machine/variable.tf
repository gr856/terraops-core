variable "linuxvm" {
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    network_interface_ids = list(string)
    os_disk = list(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = list(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
  }))
}
