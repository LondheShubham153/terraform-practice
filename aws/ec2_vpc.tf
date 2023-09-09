provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
}


resource "aws_key_pair" "key" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"

  # using default VPC
  vpc_id      = aws_default_vpc.default_vpc.id
  ingress {
    description = "TLS from VPC"

    # we should allow incoming and outoging
    # TCP packets
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    # allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

variable "ami_id" {
  description = "this is ubuntu ami id"
  default     = "ami-053b0d53c279acc90"
}

variable "tags" {
  type = map(string)
  default = {
    "name" = "Shubham's ec2"
  }
}

resource "aws_instance" "my_ec2" {
  ami             = var.ami_id
  instance_type   = "t2.micro"

  # refering key which we created earlier
  key_name        = aws_key_pair.key.key_name

  # refering security group created earlier
  security_groups = [aws_security_group.allow_ssh.name]

  tags = var.tags
}

output "arn" {
  value = aws_instance.my_ec2.arn
}

output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}
