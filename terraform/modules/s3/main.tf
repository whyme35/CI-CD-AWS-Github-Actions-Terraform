provider "aws" {
region = var.region
}

resource "aws_s3_bucket" "s3Bucket" {
     bucket = var.webpage_assets_bucket
}

resource "aws_s3_bucket_website_configuration" "s3Bucket" {
    bucket = var.webpage_assets_bucket
    index_document {
        suffix = "index.html"
    } 
}

resource "aws_s3_object" "s3Bucket_object" {
depends_on = [
  aws_s3_bucket.s3Bucket
]
bucket = var.webpage_assets_bucket
for_each = fileset("${path.root}/../assets/", "*")
key = "${each.value}"
source = "../assets/${each.value}"
source_hash = filemd5("${path.root}/../assets/${each.value}")
content_type = "text/html"
acl = "public-read"
}