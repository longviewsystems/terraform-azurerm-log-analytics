# Overview
This repo is a Log Analytics Module consumable compatible with the CAF LZ. The design philosophy of this consumable is that it is meant to be run by a pipeline, therefore there is a level of abstraction from the user for values which should be set in the answers file (linux-vm.tfvars). The Terraform configuration files are scaffolded at the root of the repo.

------------

# Requirements
1. Populate the `linux-vm.tfvars` answers file accordingly for your environment. Reference `examples` for a sample.
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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.88.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.88.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.logs](https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/automation_account) | resource |
| [azurerm_log_analytics_linked_service.logs](https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/log_analytics_linked_service) | resource |
| [azurerm_log_analytics_solution.logs](https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/log_analytics_workspace) | resource |
| [azurerm_security_center_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/2.88.1/docs/resources/security_center_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_LA_Workspace_Name"></a> [LA\_Workspace\_Name](#input\_LA\_Workspace\_Name) | Name of Log Analystics Workspace. | `any` | n/a | yes |
| <a name="input_LA_retention_in_days"></a> [LA\_retention\_in\_days](#input\_LA\_retention\_in\_days) | The workspace data retetion in days. Possible values range between 30 and 730. | `number` | `30` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location where resources should be deployed. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group to deploy resources in. | `any` | n/a | yes |
| <a name="input_security_center_subscription"></a> [security\_center\_subscription](#input\_security\_center\_subscription) | List of subscriptions this log analytics should collect data for. Does not work on free subscription. | `list(string)` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specified the Sku of the Log Analytics Workspace. | `string` | `"PerNode"` | no |
| <a name="input_solutions"></a> [solutions](#input\_solutions) | A list of solutions to add to the workspace. Should contain solution\_name, publisher and product. | `list(object({ solution_name = string, publisher = string, product = string }))` | `[]` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_LA_name"></a> [LA\_name](#output\_LA\_name) | Log Analytics Workspace id.  This is a guid. |
| <a name="output_LA_resource_id"></a> [LA\_resource\_id](#output\_LA\_resource\_id) | Resource Id of Log Analytics resource in Azure. |
| <a name="output_LA_workspace_id"></a> [LA\_workspace\_id](#output\_LA\_workspace\_id) | Log Analytics Workspace id.  This is a guid. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->