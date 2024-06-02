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