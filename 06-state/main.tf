terraform {
  backend "s3" {
    bucket = "terraform-b75-koushik"
    key = "06-state/terrafor.tfstate"
    region = "us-east-1"
  }

}