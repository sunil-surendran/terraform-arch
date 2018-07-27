# VPC
resource "aws_vpc" "sunil-tf-vpc" {
  count                = "${var.create_vpc ? 1 : 0}"
  cidr_block           = "${var.cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags {
    Name           = "sunil-tf1-vpc"
    Owner          = "sunil.surendran"
    ExpirationDate = "2018-06-30"
    Project        = "Learning"
    Environment    = "Testing"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "sunil-tf-igw" {
  count  = "${var.create_vpc ? 1 : 0}"
  vpc_id = "${aws_vpc.sunil-tf-vpc.id}"
}
