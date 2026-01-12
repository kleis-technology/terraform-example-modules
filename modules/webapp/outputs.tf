output "ami_id" {
  value       = data.aws_ami.debian_latest.id
  description = "The ID of the AMI that will run on the instances"
}

output "rendered_user_data" {
  value       = local.webserver_config_data
  description = "The rendered user data for the instance"
}
