// Global variables
variable "region"{
  default = "default"
  description = "region"
}

variable "owner" {
  c
  description = "owner"
}
variable "shared_credentials_file" {
  default = "/home/djohn/.aws/credentials"
}

variable "aws_profile" {
  default = "default"
}


variable "jenkins_username" {
  description = "Jenkins username"
  default = "admin"
}

variable "jenkins_password" {
  description = "Jenkins password"
  default = "admin"
}









// Default variables

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}



// Jenkins Master

variable "dav-jenkins_instance_type" {
  description = "Jenkins Master instance type"
  default     = "t3.small"
}

