resource "aws_instance" "myserver-nginx" {
  # Using the aws ubuntu server
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id  = aws_subnet.public-subnet.id
  vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install nginx -y
            sudo system start nginx
            EOF

  tags = {
    Name = "Nginx-server"
  }
}