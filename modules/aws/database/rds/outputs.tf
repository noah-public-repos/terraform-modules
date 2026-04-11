output "db_instance_arn" {
  description = "ARN of the RDS instance."
  value       = aws_db_instance.this.arn
}

output "db_instance_endpoint" {
  description = "Connection endpoint for the RDS instance."
  value       = aws_db_instance.this.endpoint
}

output "db_instance_address" {
  description = "Hostname of the RDS instance."
  value       = aws_db_instance.this.address
}

output "db_instance_port" {
  description = "Port of the RDS instance."
  value       = aws_db_instance.this.port
}

output "db_instance_identifier" {
  description = "Identifier of the RDS instance."
  value       = aws_db_instance.this.identifier
}

output "db_subnet_group_name" {
  description = "Name of the DB subnet group."
  value       = aws_db_subnet_group.this.name
}

output "security_group_id" {
  description = "Security group attached to the RDS instance."
  value       = aws_security_group.this.id
}

output "master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret for the managed master user password."
  value       = try(aws_db_instance.this.master_user_secret[0].secret_arn, null)
}
