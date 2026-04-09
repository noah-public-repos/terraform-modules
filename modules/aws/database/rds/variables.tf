variable "identifier" {
  description = "Unique identifier for the RDS instance."
  type        = string
}

variable "engine" {
  description = "Database engine to use, such as postgres or mysql."
  type        = string
}

variable "engine_version" {
  description = "Exact database engine version."
  type        = string
  default     = null
}

variable "instance_class" {
  description = "Instance class for the RDS instance."
  type        = string
}

variable "allocated_storage" {
  description = "Amount of storage in gibibytes to allocate."
  type        = number
}

variable "db_name" {
  description = "Name of the initial database to create."
  type        = string
  default     = null
}

variable "port" {
  description = "Port the database will listen on."
  type        = number
  default     = 5432
}

variable "username" {
  description = "Master username for the database."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the security group."
  type        = string
}

variable "allowed_security_group_ids" {
  description = "Security group IDs allowed to access the database."
  type        = list(string)
  default     = []
}

variable "backup_retention_period" {
  description = "Number of days to retain backups."
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
