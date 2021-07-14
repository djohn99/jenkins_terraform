terraform {
    
    backend "s3" {
    bucket = "dav-tf-bucket"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
