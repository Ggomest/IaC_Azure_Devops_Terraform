# Define Local values in Terraform
locals {
  owners = var.business_division
  environment = var.environment
  resource_name_prefix = "${var.environment}-${var.resource_group_location}"
  common_tags = {
      owners = local.owners,
      environment = local.environment
  }
}