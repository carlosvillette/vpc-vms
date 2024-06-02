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

variable "security_group_ids" {
  description = "the ids of teh security groups to apply to the launch template"
  type = list(string)
} 

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