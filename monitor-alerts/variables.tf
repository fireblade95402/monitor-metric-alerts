variable "resource-group" {
  description = "(Required) Resource Group for monitor-alerts to be created"  
}

variable "location" {
  description = "(Required) Location of the monitor-alerts to be created"  
}

variable "monitor-alerts-object" {
  description = "(Required) monitor-alerts Object configuration"  
}

variable "tags" {
  description = "(Required) Tags of the monitor-alerts to be created"  
}
