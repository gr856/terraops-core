
resource "azurerm_resource_group" "RGS" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags

}
