resource "azurerm_monitor_metric_alert" "alerts" {
  for_each            = var.monitor-alerts-object    
  name                = each.value.name
  resource_group_name = var.resource-group
  description         = each.value.description
  scopes              = each.value.scopes
  enabled             = each.value.enabled                                              
  auto_mitigate       = each.value.auto_mitigate                                              
  frequency           = each.value.frequency                                                
  severity            = each.value.severity                                               
  window_size         = each.value.window_size                                               
  tags                = var.tags

  dynamic "criteria" {
      for_each = each.value.criteria
      content {
        metric_namespace = criteria.value.metric_namespace
        metric_name      = criteria.value.metric_name
        aggregation      = criteria.value.aggregation
        operator         = criteria.value.operator
        threshold        = criteria.value.threshold
        dynamic "dimension" {
            for_each = criteria.value.dimension
            content  {
              name = dimension.value.name
              operator = dimension.value.operator
              values = dimension.value.values
            }
        }   
      }
  }
  dynamic "action" {
    for_each = each.value.action
    content {
      action_group_id = action.value.action_group_id
      webhook_properties = action.value.webhook_properties 
    }
  }
}