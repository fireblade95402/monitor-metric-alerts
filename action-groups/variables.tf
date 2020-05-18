variable "resource-group" {
  description = "(Required) Resource Group for action-group to be created"  
}

variable "location" {
  description = "(Required) Location of the action-group to be created"  
}

variable "action-groups-object" {
  description = "(Required) action-group Object configuration"  
}

variable "tags" {
  description = "(Required) Tags of the action-group to be created"  
}
