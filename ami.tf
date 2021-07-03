provider "aws" {
  region = var.region
}
data "aws_ami" "jenkins" {
  most_recent = true
  owners      = [""]

  filter {
    name   = "name"
    values = ["jenkins"]
  }
}

output "ami_id" {
  value = "${data.aws_ami.jenkins.id}"
}

output "name" {
  value = "${data.aws_ami.jenkins.name}"
}
