resource "aws_instance" "instance" {
  ami = var.ami_id
  associate_public_ip_address = true
  instance_type = var.instance_type
  security_groups = [ var.security_group_id ]
  subnet_id = var.subnet_ids[0]

  tags = {
    key                 = "Name"
    value               = "${var.environment}-web-server"
    propagate_at_launch = true
  }
  
}