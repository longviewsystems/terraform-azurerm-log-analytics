variable "LA_Workspace_Name" {
  type        = string
}

variable "Automation_Account_Name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "security_center_subscription" {
  type        = list(string)
}

variable "solutions" {
  type        = list(any)
}

variable "tags" {
  type        = map(string)
}