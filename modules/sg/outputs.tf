output "server_sg_id" {
  value = aws_security_group.server_sg.id
}

output "load_balancer_sg_id" {
  value = aws_security_group.load_balancer_sg.id
}