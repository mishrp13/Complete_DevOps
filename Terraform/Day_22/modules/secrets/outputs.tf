output "db_password" {
  description = "Generate Database password"
  value = random_password.db_password.result
  sensitive = true
}

output "secret_arn" {
  description = "ARN of the secret in Secrets manager"
  value = aws_secretsmanager_secret.db_password.arn
}