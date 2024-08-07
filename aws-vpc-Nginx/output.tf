output "instance_public_ip" {
    value = aws_instance.myserver-nginx.public_ip
  
}
