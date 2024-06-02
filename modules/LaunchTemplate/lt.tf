resource "aws_launch_template" "this" {
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.instance_name
  vpc_security_group_ids = var.security_group_ids
  user_data = base64encode(var.user_data)
  tags = var.lt_tags
  lifecycle {
    create_before_destroy = true
  }
}