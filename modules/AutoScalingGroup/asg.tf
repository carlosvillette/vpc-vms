resource "aws_autoscaling_group" "this" {
  name_prefix           = "app1-auto-scaling-group-"
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
  vpc_zone_identifier   = var.subnet_ids
  health_check_type          = "ELB"
  health_check_grace_period  = var.health_check_grace_period
  force_delete               = true
  target_group_arns          = [var.target_group_arn]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = var.heartbeat_timeout_launch
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = var.heartbeat_timeout_terminate
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  #tags = var.tags
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "this" {
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.this.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = var.estimated_instance_warmup

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.target_value
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.name
  lb_target_group_arn   = var.target_group_arn #alb_target_group_arn is deprecated this is not an error even if the IDE says so
}