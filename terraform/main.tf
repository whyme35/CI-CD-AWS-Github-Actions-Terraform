terraform {
  backend "s3" {
    bucket = "rj-terraform-bucket"
    key    = "state/"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
}


resource "aws_s3_bucket" "s3Bucket" {
     bucket = "rj-assets-bucket"
}

resource "aws_s3_bucket_acl" "s3Bucket" {
     bucket = "rj-assets-bucket"
     acl       = "public-read"
}

resource "aws_s3_bucket_website_configuration" "s3Bucket" {
    bucket = "rj-assets-bucket"
    index_document {
        suffix = "index.html"
    } 
}