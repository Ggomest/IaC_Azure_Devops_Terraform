#Virtual network outputs
## virtual network name
output "virtual_network_name" {
    description = "virtual network name"
    value = azurerm_virtual_network.vnet.name
}

##virtual network ID 
output "virtual_network_id" {
    description = "virtual network ID"
    value = azurerm_virtual_network.vnet.id
}

#subnet ouputs
##subnet name
output "web_subnet_name" {
    description = "webTier subnet name"
    value = azurerm_subnet.websubnet.name
}

##subnet ID
output "web_subnet_id" {
    description = "webTier subnet ID"
    value = azurerm_subnet.websubnet.id
}

#network security group
output "web_subnet_nsg_name" {
    description = "webTier subnet NSG name"
    value = azurerm_network_security_group.web_subnet_nsg.name
}

#web subnet NSG ID
output "web_subnet_nsg_id" {
    description = "webTier subnet NSG ID"
    value = azurerm_network_security_group.web_subnet_nsg.id
}



