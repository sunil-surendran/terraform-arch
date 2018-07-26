provider "aws" {
  region = "${var.region}"
}

module "vpc" {
    source = "./modules/vpc"
    cidr = "${var.cidr}"
    create_vpc = "${var.create_vpc}"
}

module "subnet" {
    create_vpc = "${var.create_vpc}"
    source = "./modules/subnet"
    pub_cidr = "${var.pub_cidr}"
    priv_cidr = "${var.priv_cidr}"
    list_az = "${var.list_az}"
    vpc_id = "${module.vpc.vpc_id}"
}
