terraform {
  required_version = "~> 1.2.3"
  backend "s3" {
    bucket = "rj-terraform-bucket"
    key    = "state"
    region = "us-east-1"
  }
}

module "s3_bucket"{
source = "./modules/s3"
region = var.region
webpage_assets_bucket = var.webpage_assets_bucket
}
