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