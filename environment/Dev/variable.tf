variable "resource_group" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}
variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}
variable "storage_account" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}
variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
variable "key_vault" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string

  }))
}
variable "acr" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}
variable "aks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    node_count          = number
    vm_size             = string
    dns_prefix          = string
  }))
}
variable "nic" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = list(object({
      name                          = string
      vnet_name                     = string
      subnet_name                   = string
      private_ip_address_allocation = string
      public_ip_id                  = optional(string)
    }))

    tags = optional(map(string))
  }))
}
variable "linuxvm" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    nic_name            = string
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

