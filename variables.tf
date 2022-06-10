variable "la_workspace_name" {
  type        = string
  description = "Name of Log Analystics Workspace."
}

variable "automation_account_name" {
  type        = string
  description = "Name of Automation Account."
}

variable "resource_group_name" {
  type        = string
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  type        = string
  description = "Azure location where resources should be deployed."
}

variable "sku" {
  type        = string
  description = "Specified the Sku of the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "la_retention_in_days" {
  type        = number
  description = "The workspace data retetion in days. Possible values range between 30 and 730."
  default     = 30
}

variable "security_center_subscription" {
  description = "List of subscriptions this log analytics should collect data for. Does not work on free subscription."
  type        = list(string)
  default     = []
}

variable "activity_log_subscriptions" {
  description = "List of subscriptions this log analytics should collect Activity Logs (Diagnostic Logs) for."
  type        = map(string)
  default = {
    # SUB-1 = "XXXX-XXXX-49e0-9160-a756147abaa4"
    # SUB-2 = "XXXX-XXXX-4710-958a-2fc1fb7ba842"
    # SUB-3 = "XXXX-XXXX-4e2d-b243-4cef0766f9d1"
  }
}


variable "solutions" {
  type        = list(any)
  description = "A list of solution names to add to the workspace."

  default = [
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
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
