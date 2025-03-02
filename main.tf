provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = "Allow inbound traffic to the web server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_server_sg" {
  name        = "db_server_sg"
  description = "Allow inbound traffic to the database server"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "keypair"
  security_groups = [aws_security_group.web_server_sg.name]
  tags = {
    Name = "WebServer"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              udo apt install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<html><body><h1>Welcome to My E-commerce Site!</h1></body></html>" > /var/www/html/index.html
              EOF
}

resource "aws_instance" "db_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "keypair"
  security_groups = [aws_security_group.db_server_sg.name]
  tags = {
    Name = "DBServer"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y mysql-server
              sudo systemctl start mysql
              sudo systemctl enable mysql
              sudo mysql_secure_installation
              EOF
}
