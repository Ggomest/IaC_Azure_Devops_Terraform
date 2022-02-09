#Generic input variables
#Business Division
variable "business_division" {
    description = "Business division"
    type = string
    default = "sap"
}
#Environment variable
variable "environment" {
    description = "Environment variable used as prefix"
    type = string
    default ="dev"
  
}
#Azure Resource Group Name
variable "resource_group_name" {
  description = "Resource Group name"
  type = string
  default = "rg-default"
}
#Azure Resources Location
variable "resource_group_location" {
  description = "Region to create Azure Resources"
  type = string
  default = "uksouth"
  
}