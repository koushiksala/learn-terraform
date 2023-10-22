terraform {
  backend "s3" {
    bucket = "terraform-b75-koushik"
    key = "06-state/terraform.tfstate"
    region = "us-east-1"
  }

}