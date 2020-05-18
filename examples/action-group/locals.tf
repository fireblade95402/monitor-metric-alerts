locals {
    location = "uksouth"
    prefix = "test2"
    resource_groups = {
        test = { 
            name     = "-action-groups"
            location = "uksouth" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "alerts"
    }
}