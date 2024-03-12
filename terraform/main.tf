
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-manual496733258422"
    key    = "terraform"
    region = "${var.region}"
  }
}


provider "aws" {
      region     = "${var.region}"
}

#Este bucket debe iniciar la ami generada con mi packer
resource "aws_s3_bucket" "test" {
  bucket = "prueba-496733258422"

  tags = {
    Name        = "prueba-496733258422"
    Environment = "Dev"
  }
}