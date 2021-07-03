/*===== General Variables ========= */
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "The region of the aws account"
}

variable "vpc_cidr" {
  type    = string
  default = "172.18.0.0/16"
}

variable "subnet_cidr_1" {
  type        = string
  description = "Subnet cidr"
  default     = "172.18.0.0/24"
}