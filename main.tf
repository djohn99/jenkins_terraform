terraform {
    
    backend "s3" {
    bucket = "mainfile-tf-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
