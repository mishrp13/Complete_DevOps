output "asg_id" {
  description = "ID of the Autoscaling Group"
  value = aws_autoscaling_group.backend.id
}

output "asg_name" {
  description = "Name of the autoscaling group"
  value = aws_autoscaling_group.backend.name
}

output "asg_arn" {
  description = "ARN of the autoscaling group"
  value = aws_autoscaling_group.backend.arn
}

output "launch_template_id" {
  description = "ID of the launch template"
  value = aws_launch_template.backend.id
}

output "launch_template_version" {
  description = "Latest version of the launch template"
  value = aws_launch_template.backend.latest_version
}