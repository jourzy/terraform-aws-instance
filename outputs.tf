
/*
Defining outputs for the EC2 instance's ID and IP address
Terraform prints output values to the screen when you apply your configuration. 
Query the outputs with the terraform output command:
terraform output
terraform output instance_id
*/

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_server.public_ip
}