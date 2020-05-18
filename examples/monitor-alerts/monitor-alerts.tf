module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}


module "monitor-alerts" {
  source = "../../monitor-alerts"

  resource-group        = module.rg_test.names.test
  location              = local.location
  monitor-alerts-object  = var.monitor-alerts-object
  tags                  = local.tags
}