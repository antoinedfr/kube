resource "aws_security_group" "ecs" {
  name        = "antoine-d-ecs-sg"
  description = "Security Group des tâches ECS"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "HTTP depuis le Load Balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "antoine-d-ecs-sg"
    Owner = "antoine-d"
    TP    = "TP2"
  }
}