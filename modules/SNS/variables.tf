variable "email" {
  description = "the email to send the SNS notification"
  type = string
}

variable "group_names" {
  description = "the group names of the autoscaling groups to attach the sns notification too"
  type = list(string)
}