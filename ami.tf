provider "aws" {
  region = var.region
}
data "aws_ami" "dav-jenkins" {
  most_recent = true
  owners      = [var.owner]

  filter {
    name   = "name"
    values = ["dav-jenkins"]
  }
}

output "ami_id" {
  value = "${data.aws_ami.dav-jenkins.id}"
}

output "name" {
  value = "${data.aws_ami.dav-jenkins.name}"
}
