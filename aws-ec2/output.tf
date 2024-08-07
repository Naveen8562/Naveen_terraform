output "aws_instance_public_ip" {
    value = aws_instance.myserver.public_ip
        
}
output "name" {
    value = random_id.random_id.hex
}

