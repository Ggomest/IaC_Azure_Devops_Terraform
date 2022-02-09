# Resource-1: Create webtier subnet
resource "azurerm_subnet" "websubnet" {
    name = "${var.web_subnet_name}-${azurerm_virtual_network.vnet.name}"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.web_subnet_address 
}

#Resource-2: Create network security group (NSG)
resource "azurerm_network_security_group" "web_subnet_nsg" {
    name = "nsg-${azurerm_subnet.websubnet.name}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

#Resource-3: Associate NSG and subnet
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
   depends_on = [
      azurerm_network_security_rule.web_nsg_rule_inbound
    ]
    subnet_id = azurerm_subnet.websubnet.id
    network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}

#Resource-4: Create NSG rules
##Locals Block for security rules
locals {
  web_inbound_ports_map ={
      "100": "80",
      "110":"443",
      "120": "22"
  }
}
##NSG inbound rule for webtier subnets
resource "azurerm_network_security_rule" "web_nsg_rule_inbound" {
  for_each = local.web_inbound_ports_map
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
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}