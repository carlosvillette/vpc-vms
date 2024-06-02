variable "vpc_id" {
  description = "the id of the associated vpc"
  type = string
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