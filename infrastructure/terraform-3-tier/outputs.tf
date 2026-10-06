output "lb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.web.dns_name
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.main.endpoint
}

output "db_master_secret_arn" {
  description = "Secrets Manager ARN holding the generated DB master password"
  value       = aws_db_instance.main.master_user_secret[0].secret_arn
}
