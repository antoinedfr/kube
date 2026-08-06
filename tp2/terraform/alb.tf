resource "aws_lb" "alb" {
  name               = "antoine-d-alb-web-bc"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = data.aws_subnets.default.ids

  tags = {
    Name  = "antoine-d-alb-web-bc"
    Owner = "antoine-d"
    TP    = "TP2"
  }
}

resource "aws_lb_target_group" "tg" {
  name        = "antoine-d-tg-web-bc"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.default.id

  health_check {
    enabled = true
    path    = "/"
    matcher = "200"
  }

  tags = {
    Name  = "antoine-d-tg-web-bc"
    Owner = "antoine-d"
    TP    = "TP2"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}