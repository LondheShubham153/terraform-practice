provider "aws" {
    region  =   "us-west-2"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "EC2_One" {
    ami = "ami-0ceecbb0f30a902a6"
    instance_type = "t2.micro"
}