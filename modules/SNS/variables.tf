variable "email" {
  description = "the email to send the SNS notification"
  default = string
}

variable "group_names" {
  description = "the group names of the autoscaling groups to attach the sns notification too"
  type = list(string)
}