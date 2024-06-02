resource "aws_lb" "this" {
  internal = false
  load_balancer_type = "application"
  security_groups = var.security_groups
  subnets = var.subnets
  enable_deletion_protection = false
  tags = {
    Name = "${var.env}-lb-${var.region}"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}