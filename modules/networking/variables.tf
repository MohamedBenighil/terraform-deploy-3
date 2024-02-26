variable "resource_group_name" {
  type = string
  description = "This defines the name of resource group"
}

variable "location" {
  type = string
  description = "This defines the location of virtual network"
}

variable "virtual_network_name" {
  type = string
  description = "This defines the name of virtual network"
}

variable "virtual_network_address_space" {
  type = string
  description = "This defines the address space of virtual network"
}

# Subnets
variable "subnet_names" {
  type = set(string)
  description = "This defines the subnets within the virtual network"
}

# Bastion
variable "bastion_required" {
  type = bool
  description = "This defines whether the bastion service is required"
  default = false
}

# Security group
variable "network-security_group_names" {
  type = map(string)
  description = "This defines names of the network security group"
}

# Rules
variable "network-security_group_rules" {
  type = list
  description = "This defines the network security group rules"
} 