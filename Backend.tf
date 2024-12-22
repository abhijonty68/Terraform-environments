terraform {
  backend "s3" {
    bucket         = "abhishekjonty121"
    key            = "env/${var.environment}/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
  }
}
