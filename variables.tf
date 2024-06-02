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

variable "vpc_id" {
  description = "The vpc id"
  type = string
}

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
/*
variable "security_group_ids" {
  description = "the ids of teh security groups to apply to the launch template"
  type = list(string)
} 
*/
variable "user_data" {
  description = "the startup script for the instances"
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
/*
variable "security_groups" {
  description = "security group id's for the load balancer"
  type = list(string)
}

variable "subnets" {
  description = "subnet id's for the load balancer"
  type = list(string)
}

variable "target_group_arn" {
  description = "The arn value of the target group"
  type = string
}

variable "subnet_ids" {
  description = "the id's of the subnets"
  type = list(string)
}

variable "target_group_arns" {
  description = "the arn values of the target groups"
  type = list(string)
}

variable "launch_template_id" {
  description = "the id of the lauch template"
  type = string
}

variable "target_group_arn" {
  description = "the target group arn for the aws_autoscaling_attachment"
  type = string
}
*/
variable "email" {
  description = "the email to send the SNS notification"
  default = string
}
/*
variable "group_names" {
  description = "the group names of the autoscaling groups to attach the sns notification too"
  type = list(string)
}
*/