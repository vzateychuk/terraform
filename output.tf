output "instance_ami" {
  value = aws_instance.my-tomcat.ami
}

output "instance_arn" {
  value = aws_instance.my-tomcat.arn
}
