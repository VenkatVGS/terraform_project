resource "aws_lb" "my_applb" {
  load_balancer_type = var.load_balan_type
  security_groups = [var.public_sg_elb]
  
  subnet_mapping {
    subnet_id     = var.public_subnet_1_elb
    }

  subnet_mapping {
    subnet_id     = var.public_subnet_2_elb
    }
 tags = {
    Name = "Application_lb"
  }

}

resource "aws_lb_target_group" "target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.myvpc_elb
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_applb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "attachment_1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.web_1_elb
  port             = 80
}

resource "aws_lb_target_group_attachment" "attachment_2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.web_2_elb
  port             = 80
}