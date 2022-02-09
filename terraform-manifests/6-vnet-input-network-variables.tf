#Virtual Network, Subnets and Subnet NSG's

#Virtual Network
variable "vnet_name" {
    description = "virtual network name"
    type = string
    default = "vnet-default"  
}
#Virtual Network address space
variable "vnet_address_space" {
    description = "virtual network address spaces"
    type = list(string)
    default = [ "10.0.0.0/16" ]  
}
#Web subnet name 
variable "web_subnet_name" {
    description = "virtual network web subnet name"
    type = string
    default = "websubnet"
}
#Web subnet address space
variable "web_subnet_address" {
    description = "virtual network web subnet address spaces"
    type = list(string)
    default = ["10.0.1.0/24"]
}

#App subnet name 
variable "app_subnet_name" {
    description = "virtual network app subnet name"
    type = string
    default = "appsubnet"
}

#App subnet address space
variable "app_subnet_address" {
    description = "virtual network app subnet address space"
    type = list(string)
    default = ["10.0.11.0/24"]
}

#Database subnet name
variable "db_subnet_name" {
    description = "virtual network database subnet name"
    type = string
    default = "dbsubnet"
}

#Database subnet address space
variable "db_subnet_address" {
    description = "virtual network database subnet address spaces"
    type = list(string)
    default = [ "10.0.21.0/24" ]  
}

#Bastion/ Management subnet name
variable "bastion_subnet_name" {
    description = "virtual network bastion subnet name"
    type = string
    default = "bastionsubnet"
}

#Bastion/Management subnet address space
variable "bastion_subnet_address" {
    description = "virtual network bastion subnet address spaces"
    type = list(string)
    default = [ "10.0.100.0/24" ]
}


