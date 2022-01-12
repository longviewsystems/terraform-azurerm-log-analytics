tags = {
  environment = "production",
  costcenter  = "",
  managedBy   = "Terraform",
  owner       = "",
  TFLevel     = "L1"
}
resource_group_name = "RG-TF-Test-LA"
location            = "canadacentral"
LA_Workspace_Name   = "Test-Log-Analytics"
solutions = [
  "AgentHealthAssessment",
  "AntiMalware",
  "AzureActivity",
  "ChangeTracking",
  "Security",
  "SecurityInsights",
  "ServiceMap",
  "SQLAssessment",
  "Updates",
  "VMInsights"
] 

security_center_subscription = []

Automation_Account_Name = "Test-AA-LA"