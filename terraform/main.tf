#En la instancia manual debemos instalar terraform, packer, git y el bucket S3

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
    region = "us-east-1"
  }
}


provider "aws" {
      region     = "us-east-1"
}

#Este bucket debe iniciar la ami generada con mi packer
resource "aws_s3_bucket" "test" {
  bucket = "prueba-496733258422"

  tags = {
    Name        = "prueba-496733258422"
    Environment = "Dev"
  }
}