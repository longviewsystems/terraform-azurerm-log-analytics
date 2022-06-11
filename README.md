# Overview
This repo creates a Log Analytics Module, and commonly required configurations for Azure Log Analytics.

# References
* [Azure Monitor best practices - Configure data collection](https://docs.microsoft.com/en-us/azure/azure-monitor/best-practices-data-collection)

------------

# Usage

``` terraform
module "LA" {
  source                       = "../../" #testing root module.
  resource_group_name          = "rg-name"
  location                     = "westus2"
  la_workspace_name            = "la-name"
  automation_account_name      = "automation-name"
}

```

------------
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.99.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) | resource |
| [azurerm_log_analytics_linked_service.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_linked_service) | resource |
| [azurerm_log_analytics_solution.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.sub_diags](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_security_center_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activity_log_subscriptions"></a> [activity\_log\_subscriptions](#input\_activity\_log\_subscriptions) | List of subscriptions this log analytics should collect Activity Logs (Diagnostic Logs) for. | `map(string)` | `{}` | no |
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | Name of Automation Account. | `string` | n/a | yes |
| <a name="input_la_retention_in_days"></a> [la\_retention\_in\_days](#input\_la\_retention\_in\_days) | The workspace data retetion in days. Possible values range between 30 and 730. | `number` | `30` | no |
| <a name="input_la_workspace_name"></a> [la\_workspace\_name](#input\_la\_workspace\_name) | Name of Log Analystics Workspace. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where resources should be deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group to deploy resources in. | `string` | n/a | yes |
| <a name="input_security_center_subscription"></a> [security\_center\_subscription](#input\_security\_center\_subscription) | List of subscriptions this log analytics should collect data for. Does not work on free subscription. | `list(string)` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specified the Sku of the Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_solutions"></a> [solutions](#input\_solutions) | A list of solution names to add to the workspace. | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_la_name"></a> [la\_name](#output\_la\_name) | Log Analytics Workspace id.  This is a guid. |
| <a name="output_la_resource_id"></a> [la\_resource\_id](#output\_la\_resource\_id) | Resource Id of Log Analytics resource in Azure. |
| <a name="output_la_workspace_id"></a> [la\_workspace\_id](#output\_la\_workspace\_id) | Log Analytics Workspace id.  This is a guid. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->