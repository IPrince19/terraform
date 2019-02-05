variable "profile" {
  description = "AWS Profile"
  default     = "default"
}

variable "role_name" {
  description = "Name of role"
}

variable "permitted_account_id" {
  description = "Account ID of AWS account which gets the permission to the role"
}
