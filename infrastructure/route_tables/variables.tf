variable "create_vpc" {}
variable "vpc_id" {}
variable "gateway_id" {}
variable "nat_id" {}
variable "private_rt" {}
variable "list_az" {
    type = "list"
    }
variable "public_subnet_id" {
    type = "list"
    }
variable "private_subnet_id" {
    type = "list"
    }
variable "subnet_pri" {
    type = "list"
    }

