
module "rgs" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.resource_group
}
module "virtual_network" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.rgs, module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets
}
module "storage_account" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_storage_account"
  stgs       = var.storage_account
}
module "key_vault" {
  depends_on = [ module.rgs ]
  source = "../../module/azurerm_key_vault"
  key_vault = var.key_vault  
}
module "acr" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_container_registry"
  acr        = var.acr
}
module "aks" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_kubernetes_cluster"
  aks        = var.aks
}
module "nic" {
  depends_on = [ module.rgs ]
  source = "../../module/azurerm_network_interface"
  nic = var.nic  
}
module "linuxvm" {
  depends_on = [ module.nic ]
  source = "../../module/azurerm_linux_virtual_machine"
    linuxvm = {
    for k, v in var.linuxvm : k => merge(v, {
      network_interface_ids = module.nic.nic_ids
    })
  }
} 
  
  

