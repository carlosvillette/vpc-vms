variable "vpc_id" {
  description = "The vpc id"
  type = string
}

variable "server_egress" {
  description = "The egress rules of the server"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "server_ingress" {
  description = "The ingress rules of the server"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "lb_egress" {
  description = "The egress rules of the load balancer"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "lb_ingress" {
  description = "The ingress rules of the load balancer"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "env" {
  description = "The environemnt the terraform code is launched"
  type = string
}

variable "region" {
  description = "The region the resource is launched in"
  type = string
}