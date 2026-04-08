variable "name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key."
  type        = string
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key."
  type        = string
  default     = null
}

variable "attributes" {
  description = "List of nested attribute definitions. Only required for hash_key and range_key attributes."
  type = list(object({
    name = string
    type = string
  }))
  default = []
}

variable "point_in_time_recovery_enabled" {
  description = "Whether to enable point-in-time recovery."
  type        = bool
  default     = false
}

variable "global_secondary_indexes" {
  description = "List of global secondary index definitions."
  type = list(object({
    name               = string
    hash_key           = string
    range_key          = optional(string)
    projection_type    = optional(string, "ALL")
    non_key_attributes = optional(list(string))
  }))
  default = []
}

variable "ttl_attribute_name" {
  description = "The name of the table attribute to store the TTL timestamp in."
  type        = string
  default     = null
}

variable "deletion_protection_enabled" {
  description = "Enables deletion protection for the table."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
