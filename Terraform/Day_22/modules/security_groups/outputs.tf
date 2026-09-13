output "web_sg_id" {
  description = "Id of the web server security group"
  value = aws_security_group.web.id
}

output "db_sg_id" {
  description = "Id of the DB server security group"
  value = aws_security_group.db.id
}