terraform {
  required_version = ">= 1.0"
}

module "example_table" {
  source = "../../../../modules/aws/storage/dynamo-db"

  name      = "ExampleTable"
  hash_key  = "partitionKey"
  range_key = "sortKey"

  attributes = [
    {
      name = "partitionKey"
      type = "S"
    },
    {
      name = "sortKey"
      type = "S"
    },
    {
      name = "status"
      type = "S"
    },
    {
      name = "createdAt"
      type = "N"
    },
  ]

  point_in_time_recovery_enabled = true
  deletion_protection_enabled    = true
  ttl_attribute_name             = "expiresAt"

  global_secondary_indexes = [
    {
      name      = "StatusIndex"
      hash_key  = "status"
      range_key = "createdAt"
    },
  ]

  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
