provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "keypair"
  tags = {
    Name = "WebServer"
  }
}
resource "aws_instance" "db_server" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "keypair"
  tags = {
    Name = "DBServer"
  }
}
