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
        id   = "349933e16c8a438b0acc75ce44fac2035f8df75532ffcf600ff74a437cf8e648"
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }
      grant {
      grantee {
        type = "Group"
        uri = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ_ACP"
      }
            grant {
      grantee {
        type = "Group"
        uri = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ"
      }
      owner {
        id = "349933e16c8a438b0acc75ce44fac2035f8df75532ffcf600ff74a437cf8e648"
      }
}
}
resource "aws_s3_bucket_website_configuration" "s3Bucket" {
    bucket = "dev-rj-assets-bucket"
    index_document {
        suffix = "index.html"
    } 
}