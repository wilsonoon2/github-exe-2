terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "wilson-demo-bucket-12345"
}
resource "aws_s3_bucket_tagging" "demo_tags" {
  bucket = aws_s3_bucket.demo.id

  tag_set = {
    Name = "DemoBucket"
    Environment = "Dev"
  }
}
