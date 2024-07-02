output "lb_dns_name" {
  value       = "http://${module.loadBalancer.dns_name}"
  description = "The DNS name of the App1 Load Balancer."
}