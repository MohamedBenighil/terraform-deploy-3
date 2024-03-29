module "general_module" {
  source = "./modules/general"
  resource_group_name = local.resource_group_name
  location = local.location
}


module "networking_module" {
  source = "./modules/networking"
  resource_group_name = local.resource_group_name
  location = local.location
  virtual_network_name = "staging-network"
  virtual_network_address_space =  "10.0.0.0/16"
  subnet_names = [ "web-subnet", "db-subnet" ]
  # Bastion 
  bastion_required = false
  # Nsg
  network-security_group_names = {"web-nsg":"web-subnet","db-nsg":"db-subnet"}
  # rules
  network-security_group_rules = [
    {
      id=1,
      priority="200", 
      network_security_group_name="web-nsg",
      destination_port_range="3389",
      access="Allow"
    },
    {
      id=2,
      priority="300",
      network_security_group_name="web-nsg",
      destination_port_range="80",
      access="Allow"
    },
    # no need to open 1433 of db installed on vm since : allowed on VNet and No need to access from internet 
    {
      id=3,
      priority="400",
      network_security_group_name="web-nsg",
      destination_port_range="8172",
      access="Allow"
    },
    {
      id=4,
      priority="200",
      network_security_group_name="db-nsg",
      destination_port_range="3389",
      access="Allow"
    }
  ]
}


