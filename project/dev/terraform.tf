terraform {
  backend "s3" {
    bucket = "tws-terraform-state-test-d"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tws-terraform-state-test-table-d"
  }
}