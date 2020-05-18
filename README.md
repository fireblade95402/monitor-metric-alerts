# Azure Monitoring Metric Alerts and Action Groups

There're 2 steps that need to be followed to test out the creation of the action groups and monitor metric alerts. 

They have been separated to allow for flexibility then deploying.

The details below are for running the examples t oshow how the modules work.


## Step 1 - Action Groups

To run this example, simply follow to steps below: 

* Goto the examples/action-groups folder
* Change the email_address parameters (2x) before running the Terraform commands:

  * action-group.tfvars:
    ```hcl
    email_address          = "<email>" # Change to an email to test with
    ```

* Once updated the commands below can be run to execute the creation:

  ```hcl
  terraform init
  terraform plan --var-file="action-groups.tfvars" 
  terraform apply  --var-file="action-groups.tfvars" 
  ```


### Output

| Name | Type | Description | 
| -- | -- | -- | 
| action-groups-object | Object | Object with the outputs from the Action Groups provider. |


## Step 2 -Monitor Metric Alerts

To run this example, simply follow to steps below: 

* Goto the examples/monitor-alerts folder
* Change the 2 values below before running the Terraform commands:
  * action-group.tfvars:
    ```hcl
    scopes                      = ["/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage account>/blobServices/default"]" # Change to an id for the service to be monitored (one to many)

    action_group_id             = "/subscriptions/<subscription>/resourceGroups/<rsource-group>/providers/microsoft.insights/actionGroups/<action-group name>" #Change to the id for the action group created in step 1

    ```

* Once updated the commands below can be run to execute the creation:

  ```hcl
  terraform init
  terraform plan --var-file="monitor-alerts.tfvars" 
  terraform apply  --var-file="monitor-alerts.tfvars" 
  ```

### Output

| Name | Type | Description | 
| -- | -- | -- | 
| monitor-alerts-object | Object | Object with the outputs from the Monitor Alerts provider. |


## Step 3 - Destroy

* Goto to the monitor-alerts folder
* Run the following command: 
```hcl
  terraform destroy  --var-file="monitor-alerts.tfvars" 
  ```
* Goto to the action-groups folder
* Run the following command:  
```hcl
  terraform destroy  --var-file="action-groups.tfvars" 
  ```

## Notes
* Need to work out where to run the monitoring-alerts module to make sure the scope id's can be set in the module.
* The actions-group id will need to be populated in the monitoring-alerts tfvars files for linking the action groups to the monitoring alerts.