resource "local_file" "devops" {
  filename = "/home/practicevm1/Day1/terraform-variables/devopstest.txt"
  content  = var.content_map["content1"]
}

resource "local_file" "devops-var" {
  filename = var.filename
  content  = var.content_map["content2"]
}

output "devops_op_trainer" {
  value = var.devops_op_trainer
}

output "aws_ec2_instance" {
  value = var.aws_ec2_object
}
practicevm1@practicevm1:~/Day1/terraform-variables$ cat variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devope_automated.txt"
}

variable "content" {
  default = "This is auto generated from a variable"
}

variable "devops_op_trainer" {}

variable "content_map" {
  type = map(any)
  default = {
    "content1" = "This is Content1"
    "content2" = "This is Content2"
  }
}

variable "file_list" {
  type = list
  default = ["/home/practicevm1/Day1/terraform-variables/file1.txt","/home/pract                                                                             icevm1/Day1/terraform-variables/file2.txt"]
}

variable "aws_ec2_object" {
  type = object({
    name = string
    instances = number
    keys = list(string)
    ami = string
})

default = {
  name = "test_ec2_instance"
  instances = 2
  keys = ["key1.pem","key2.pem"]
  ami = "ubuntu-aaw3reoiasddv"
}
}

output "tf_batch_students" {
  value = var.no_of_students
}
