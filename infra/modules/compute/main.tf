locals {
  tags = {
    Project = var.project
    environment = var.environment
    Author = var.author
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "rose-webserver" {
    instance_type = var.instance_type
    ami = data.aws_ami.ubuntu.id
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    vpc_security_group_ids = [ var.sg ]

    lifecycle {
      prevent_destroy = false
      create_before_destroy = true
    }

    tags = local.tags

}
