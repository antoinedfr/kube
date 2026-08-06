data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_ecs_cluster" "cluster" {
  cluster_name = var.cluster_name
}

data "aws_ecs_task_definition" "web" {
  task_definition = "web-bc"
}