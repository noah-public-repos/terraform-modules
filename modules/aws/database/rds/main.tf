terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

resource "aws_db_subnet_group" "this" {
  name        = "${var.identifier}-subnet-group"
  description = "Subnet group for ${var.identifier}"
  subnet_ids  = var.subnet_ids

  tags = var.tags
}

resource "aws_security_group" "this" {
  name        = "${var.identifier}-rds"
  description = "Security group for ${var.identifier} RDS"
  vpc_id      = var.vpc_id

  tags = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "security_group" {
  for_each = toset(var.allowed_security_group_ids)

  security_group_id            = aws_security_group.this.id
  from_port                    = var.port
  to_port                      = var.port
  ip_protocol                  = "tcp"
  referenced_security_group_id = each.value
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.this.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_db_instance" "this" {
  identifier = var.identifier

  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  db_name                     = var.db_name
  port                        = var.port
  username                    = var.username
  manage_master_user_password = true

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  backup_retention_period    = var.backup_retention_period
  deletion_protection        = var.deletion_protection
  publicly_accessible        = false
  storage_encrypted          = true
  auto_minor_version_upgrade = true
  skip_final_snapshot        = true

  tags = var.tags
}
