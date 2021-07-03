data "aws_availability_zones" "available" {
  state = "available"
}

# vpc
resource "aws_vpc" "vpc_1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
}

#subnet 
resource "aws_subnet" "subnet_1" {
  cidr_block              = var.subnet_cidr_1
  vpc_id                  = aws_vpc.vpc_1.id
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
}

#internet_gateway
resource "aws_internet_gateway" "gateway_1" {
  vpc_id = aws_vpc.vpc_1.id
}

#route_table
resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_1.id
  }
}

resource "aws_route_table_association" "route_subnet_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table_1.id
}

module "cluster" {
  source             = "./terraform-aws-minikube"
  env_name           = "dev"
  subnet_id          = aws_subnet.subnet_1.id
  vpc_id             = aws_vpc.vpc_1.id
  instance_type      = "t3a.large"
  instance_disk_size = "30"
}