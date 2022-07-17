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

resource "aws_s3_bucket_website_configuration" "s3Bucket" {
    bucket = "rj-assets-bucket"
    index_document {
        suffix = "index.html"
    } 
}

resource "aws_s3_object" "s3Bucket_object" {
depends_on = [
  aws_s3_bucket.s3Bucket
]
bucket = "rj-assets-bucket"
for_each = fileset("../assets/", "*")
key = "${each.value}"
source = "../assets/${each.value}"
source_hash = filemd5("../assets/${each.value}")
content_type = "text/html"
acl = "public-read"
}