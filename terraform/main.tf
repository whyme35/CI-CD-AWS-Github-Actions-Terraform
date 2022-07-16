terraform {
  backend "s3" {
    bucket = "rj-terraform-bucket"
    key    = "dev-state/"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
}


resource "aws_s3_bucket" "s3Bucket" {
     bucket = "dev-rj-assets-bucket"
}

resource "aws_s3_bucket_acl" "s3Bucket" {
    bucket = "dev-rj-assets-bucket"
    access_control_policy {
      grant {
      grantee {
        type = "Group"
        uri = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ"
      }
      
      owner {
        id = data.aws_canonical_user_id.current.id
      }
}
}
resource "aws_s3_bucket_website_configuration" "s3Bucket" {
    bucket = "dev-rj-assets-bucket"
    index_document {
        suffix = "index.html"
    } 
}