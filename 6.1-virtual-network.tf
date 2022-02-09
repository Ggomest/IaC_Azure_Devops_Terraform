# Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name = "${var.vnet_name}-${local.resource_name_prefix}"
    address_space = var.vnet_address_space
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = local.common_tags
}