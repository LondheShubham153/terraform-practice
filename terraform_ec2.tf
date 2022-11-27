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
