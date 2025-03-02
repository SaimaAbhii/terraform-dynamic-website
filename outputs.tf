output "web_server_public_ip" {
  description = "The public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

output "db_server_public_ip" {
  description = "The public IP of the database server"
  value       = aws_instance.db_server.public_ip
}
