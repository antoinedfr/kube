variable "region" {
  type    = string
  default = "eu-west-3"
}


variable "project" {
  type = string
}

variable "author" {
  type = string
}

variable "environment" {
  type        = string
  description = "dev|staging|prod"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of the following: dev staging prod"
  }
}

variable "instance_type" {
  type = string
  validation {
    condition     = can(regex("^t2.micro$", var.instance_type))
    error_message = "Instance type must be a t2.micro"
  }
}

variable "instance_ami" {
  type = string
  validation {
    condition     = "ami-0e207c18bb303cc68" == var.instance_ami
    error_message = "Instance AMI mbust be ami-0e207c18bb303cc68"
  }
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "cidr" {
  type = string
}

variable "igw" {
  type = string
}

variable "sg" {
  type = string
}
