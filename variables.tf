variable "server_ingress" {
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "server_egress" {
   type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "lb_ingress" {
   type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "lb_egress" {
   type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr_block" {
  description = "CIDR"
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets"
  type = list(string)
}

variable "private_subnets" {
  description = "CIDR ranges for private subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets"
  type = list(string)
}

variable "private_subnets_tags" {
  description = "tags for private subnets"
  type = map(any)
}

variable "public_subnets_tags" {
  description = "tags for public subnets"
  type = map(any)
}
/*
variable "vpc_id" {
  description = "The vpc id"
  type = string
}
*/
variable "image_id" {
  description = "the image id of the instance"
  type = string
}

variable "instance_type" {
  description = "the instance size used"
  type = string
}

variable "instance_name" {
  description = "the chosen name for your instance"
  type = string
}

variable "lt_tags" {
  description = "the tags used for the launch template"
  type = object({
    Name = string
  })
}

variable "tg_name" {
  description = "the name of the launch template"
  type = string
}

variable "tg_tags" {
  description = "the tags for the target group"
  type = object({
    Name = string
  })
}

variable "email" {
  description = "the email to send the SNS notification"
  type = string
}