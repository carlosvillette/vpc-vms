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