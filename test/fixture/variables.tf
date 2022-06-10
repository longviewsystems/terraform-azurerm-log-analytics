variable "location" {
  type        = string
  description = "Azure location where resources should be deployed."
  default     = "westus"
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
  default = {
    owner = "terratest"
  }
}
