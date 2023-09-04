terraform {
  backend "s3" {
    bucket = "nstfstate"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}