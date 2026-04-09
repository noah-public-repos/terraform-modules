terraform {
  required_version = ">= 1.0"
}

module "example_rds" {
  source = "../../../../modules/aws/database/rds"

  identifier     = "example-postgres"
  engine         = "postgres"
  engine_version = "16.4"
  instance_class = "db.t4g.micro"

  allocated_storage = 20

  db_name  = "app"
  port     = 5432
  username = "app_admin"

  subnet_ids = [
    "subnet-0123456789abcdef0",
    "subnet-0fedcba9876543210",
  ]

  vpc_id                     = "vpc-0123456789abcdef0"
  allowed_security_group_ids = ["sg-0123456789abcdef0"]

  backup_retention_period = 7
  deletion_protection     = true

  tags = {
    Environment = "dev"
    Project     = "example"
  }
}
