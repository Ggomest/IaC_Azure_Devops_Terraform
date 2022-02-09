# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
    name = "${var.resource_group_name}-${local.resource_name_prefix}-gleide"
    location = var.resource_group_location
    tags = local.common_tags
}