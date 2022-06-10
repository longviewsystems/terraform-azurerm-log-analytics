# Overview
This repo is an easy-to-consume Log Analytics Module.

------------

# Requirements
1. Populate the `log-analytics.tfvars` answers file accordingly for your environment. Reference `examples` for a sample.
2. Ensure `-var-file` in `Makefile` points to a valid `.tfvars` answers file.
3. In `test/main_test.go`, ensure the `VarFiles` points to a valid `.tfvars` answers file.
4. In `test/Makefile`, ensure the `Makefile` targets are named accurately to reflect the abstractions of the `go` test suite. 
5. In `.github/workflows/integration_pipeline.yml`, ensure the `working-directory` path for Terratest is valid `(line # 42,45)` and the `run` command on `line 46` references a valid `Makefile` target. 

------------

# Limitations
N/A

------------

# Usage
To trigger a CI build in Github Actions, submit your dev/feature branch as a pull request (PR).

To trigger terratest in the local environment:
```bash
$ cd test
$ make test-loganalytics
```

To deploy to an Azure tenant:
```bash
$ make apply
```

To destroy the infra in the Azure tenant:
```bash
$ make destroy
```

To cleanup the TF configuration files in your local dev env:
```bash
$ make clean
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
| [azurerm_security_center_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | Name of Automation Account. | `string` | n/a | yes |
| <a name="input_la_retention_in_days"></a> [la\_retention\_in\_days](#input\_la\_retention\_in\_days) | The workspace data retetion in days. Possible values range between 30 and 730. | `number` | `30` | no |
| <a name="input_la_workspace_name"></a> [la\_workspace\_name](#input\_la\_workspace\_name) | Name of Log Analystics Workspace. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where resources should be deployed. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group to deploy resources in. | `string` | n/a | yes |
| <a name="input_security_center_subscription"></a> [security\_center\_subscription](#input\_security\_center\_subscription) | List of subscriptions this log analytics should collect data for. Does not work on free subscription. | `list(string)` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specified the Sku of the Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_solutions"></a> [solutions](#input\_solutions) | A list of solution names to add to the workspace. | `list(any)` | <pre>[<br>  "AgentHealthAssessment",<br>  "AntiMalware",<br>  "AzureActivity",<br>  "ChangeTracking",<br>  "Security",<br>  "SecurityInsights",<br>  "ServiceMap",<br>  "SQLAssessment",<br>  "Updates",<br>  "VMInsights"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_la_name"></a> [la\_name](#output\_la\_name) | Log Analytics Workspace id.  This is a guid. |
| <a name="output_la_resource_id"></a> [la\_resource\_id](#output\_la\_resource\_id) | Resource Id of Log Analytics resource in Azure. |
| <a name="output_la_workspace_id"></a> [la\_workspace\_id](#output\_la\_workspace\_id) | Log Analytics Workspace id.  This is a guid. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->