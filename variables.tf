variable "ACCESS_KEY" {
  type        = string
  description = "Wasabi access key"
  sensitive   = true
}

variable "SECRET_KEY" {
  type        = string
  description = "Wasabi secret key"
  sensitive   = true
}

variable "region" {
  type        = string
  description = "Default region to deploy buckets"
  default     = "eu-west-2"
}

variable "departments" {
  type        = list(string)
  description = "List of departments"
  default     = []
}

variable "users" {
  type        = list(string)
  description = "List of users"
  default     = []
}

variable "permissions" {
  type        = map(any)
  description = "Map of user permissions"
  default     = {}
}

variable "suffix" {
  type        = string
  description = "Suffix for bucket names"
  default     = "poc-20241027-1719"
}
