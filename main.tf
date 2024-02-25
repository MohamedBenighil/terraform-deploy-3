module "general_module" {
  source = "./modules/general"
  resource_group_name = local.resource_group_name
  location = local.location
}