resource "aws_s3_bucket" "my_app_bucket" {
    bucket = "${var.my_enviroment}-my-app-bucket"
}