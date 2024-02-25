module "general_module" {
  source = "../general"
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "network" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_space]
  depends_on = [ module.general_module.resourcegroup ]
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnet_names
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [cidrsubnet(var.virtual_network_address_space,8,index(tolist(var.subnet_names),each.key))] //["10.0.1.0/24"]
  depends_on = [ azurerm_virtual_network.network ]
}