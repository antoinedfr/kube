resource "aws_security_group" "alb" {
  name        = "antoine-d-alb-sg"
  description = "Security Group pour l'Application Load Balancer"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Tout le trafic sortant"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "antoine-d-alb-sg"
    Owner = "antoine-d"
    TP    = "TP2"
  }
}