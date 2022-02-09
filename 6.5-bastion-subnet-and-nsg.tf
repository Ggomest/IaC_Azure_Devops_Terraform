#Resource-1: Create bastion/management subnet
resource "azurerm_subnet" "bastionsubnet" {
    name                 = "${azurerm_virtual_network.vnet.name}-${var.bastion_subnet_name}"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = var.bastion_subnet_address
}

#Resource-2: Create network security group (NSG)
resource "azurerm_network_security_group" "bastion_subnet_nsg" {
    name = "${azurerm_subnet.bastionsubnet.name}-nsg"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

#Resource-3: Associate NSG and subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_associate" {
    depends_on = [
      azurerm_network_security_rule.bastion_nsg_rule_inbound
    ]
    subnet_id = azurerm_subnet.bastionsubnet.id
    network_security_group_id =  azurerm_network_security_group.bastion_subnet_nsg.id 
}

#Resource-4: Create NSG rules
## Locals block for security rules
locals{
    bastion_inbound_ports_map ={
      "100":"22",
      "110":"3389"
      }
}
##NSG inbound rule for webtier subnets
resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each = local.bastion_inbound_ports_map
  name                        = "rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name  
}
