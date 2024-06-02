variable "security_groups" {
  description = "security group id's for the load balancer"
  type = list(string)
}

variable "subnets" {
  description = "subnet id's for the load balancer"
  type = list(string)
}

variable "env" {
  description = "The environment"
  type = string
}

variable "region" {
  description = "the region the load balancer exists in"
  type = string
}

variable "target_group_arn" {
  description = "The arn value of the target group"
  type = string
}