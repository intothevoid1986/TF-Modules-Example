resource "aws_launch_template" "web" {
  name_prefix   = "${var.environment}-web-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  
  vpc_security_group_ids = [var.security_group_id]
  
  user_data = base64encode(templatefile("${path.module}/user-data.sh", {
    environment = var.environment
  }))
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.environment}-web-server"
    }
  }
}

resource "aws_autoscaling_group" "web" {
  name                = "${var.environment}-web-asg"
  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = [var.target_group_arn]
  health_check_type   = "ELB"
  
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Name"
    value               = "${var.environment}-web-server"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.environment}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown              = 300
  autoscaling_group_name = aws_autoscaling_group.web.name
}