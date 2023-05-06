resource "aws_instance" "my_app_server" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "${var.my_enviroment}-my-app-server"
    }
    depends_on = [ aws_s3_bucket.my_app_bucket, aws_dynamodb_table.my_app_table ]
}