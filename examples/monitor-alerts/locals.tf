locals {
    location = "uksouth"
    prefix = "test"
    resource_groups = {
        test = { 
            name     = "-monitor-alerts"
            location = "uksouth" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "alerts"
    }
}