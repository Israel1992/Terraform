

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
/*
  backend "s3" {
    bucket = "terraform-test4"
    key    = "terraform"
    region = "us-east-2"
  }
  */
  
}


provider "aws" {
      region     = "${var.region}"
}

resource "aws_s3_bucket" "this" {
  bucket                               = "${var.bucket_name}"
  force_destroy                        = "${var.force_destroy}"
}

resource "aws_s3_bucket" "example" {
  bucket = "prueba-terraform666"

  tags = {
    Name        = "TEST"
    Environment = "Dev"
  }
}