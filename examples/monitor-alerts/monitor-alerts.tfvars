monitor-alerts-object = {
    alert1 = {
        name                        = "monitor-storage-test-alert"   
        description                 = "Action will be triggered when Transactions count is greater than 50."
        scopes                      = ["/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>/blobServices/default"]                                                # String is ID's to monitor (****)
        enabled                     = true                                              # Values: true, false (default true)
        auto_mitigate               = true                                              # Values: true, falsev (default true)
        frequency                   = "PT1M"                                            # In ISO 8601 duration format (PT1M, PT5M, PT15M, PT30M and PT1H. Defaults to PT1M
        severity                    = 3                                                 # Values: 0,1,2,3,4 (default 3)   
        window_size                 = "PT5M"                                            # In ISO 8601 duration format (PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D. Defaults to PT5M
        criteria                    = {
            crit1 = {
                metric_namespace        = "Microsoft.Storage/storageAccounts/blobServices"           # Metric namespaces to be monitored
                metric_name             = "Transactions"                                # Metric nmae to be monitored 
                aggregation             = "Total"                                       # Options: Average, Count, Minimum, Maximum and Total
                operator                = "GreaterThan"                                 # Options: Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual       
                threshold               = "50"                                          # Value that activates the alert 
                dimension               = {
                    dim1 = {
                        name                = "ApiName"
                        operator            = "Include"                                     # Options: Include, Exclude
                        values              = ["*"]                                         # List of dimension values  
                    }                                                    
                }
            }
        }
        action = {
            act1 = {
                action_group_id = "/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/microsoft.insights/actionGroups/<action group>"                                                        # Action Group ID for alert
                webhook_properties = {}                                                     # Map of custom strings properties        
            }
        }   
    }
}