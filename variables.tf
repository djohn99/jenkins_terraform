// Global variables
variable "region"{
  default = "us-east-1"
}

variable "shared_credentials_file" {
  default = "/home/djohn/.aws/credentials"
}

variable "aws_profile" {
  default = "default"
}

variable "jenkins_sg_id" {
  default = "sg-5b88d708"
}

variable "jenkins_username" {
  description = "Jenkins username"
  default = "admin"
}

variable "jenkins_password" {
  description = "Jenkins password"
  default = "admin"
}

// variable "jenkins_credentials_id" {
//   description = "Slaves SSH ID"
//   default = "jenkins"
// }

variable "vpc_id" {
  default = "vpc-05215a5399646ca1d"
}

variable "vpc_private_subnets" {
  description = "List of VPC private subnets"
  type        = list
  default = ["subnet-0c0c2f9dff155fe46"]
}

variable "vpc_public_subnets" {
  description = "List of VPC Public subnets"
  type        = list
  default = ["subnet-0c0c2f9dff155fe46"]
}

// Default variables

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "SSH KeyPair"
  default = "jong-prod"
}

// Jenkins Master

variable "dav-jenkins_instance_type" {
  description = "Jenkins Master instance type"
  default     = "t3.small"
}

