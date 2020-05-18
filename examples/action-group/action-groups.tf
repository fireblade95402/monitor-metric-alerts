module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}


module "action-groups" {
  source = "../../action-groups"

  resource-group        = module.rg_test.names.test
  location              = local.location
  action-groups-object  = var.action-groups-object
  tags                  = local.tags
}