variable "subnet_ids" {
  description = "the id's of the subnets"
  type = list(string)
}

variable "launch_template_id" {
  description = "the id of the lauch template"
  type = string
}

variable "target_group_arn" {
  description = "the arn value of the target group"
  type = string
}

variable "min_size" {
  description = "minimum amount of instances an asg should create"
  type = number
}

variable "desired_capacity" {
  description = "the desired amount of instances an asg should have"
  type = number
}

variable "max_size" {
  description = "the max amount of instances an asg should have"
  type = number
}

variable "health_check_grace_period" {
  type = number
  default = 300
}

variable "heartbeat_timeout_launch" {
  type = number
  default = 60
}

variable "heartbeat_timeout_terminate" {
  type = number
  default = 300
}

variable "estimated_instance_warmup" {
  type = number
  default = 120
}

variable "target_value" {
  type = number
  default = 75.0
}