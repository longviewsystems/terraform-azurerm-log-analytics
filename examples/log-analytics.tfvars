tags = {
  environment = "Production",
  costCenter  = "",
  managedBy   = "Terraform",
  owner       = "",
  TFLevel     = "L1"
}
resource_group_name = "RG-TF-Test-WinVMModule"
location            = "canadacentral"
LA_Workspace_Name   = "Test-Log-Analytics"
solutions = [
  {
    solution_name = "AzureActivity",
    publisher     = "Microsoft",
    product       = "OMSGallery/AzureActivity",
  }
]
security_center_subscription = []
tenant_id                    = "TBD-TenantId"
subscription_id              = "TBD-SubscriptionId"