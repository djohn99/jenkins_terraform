// VPC
resource "aws_vpc" "default" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name   = "jenkins-vpc"
    Author = "djohn"
    Tool   = "Terraform"
  }
}
