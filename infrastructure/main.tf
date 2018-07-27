provider "aws" {
  region = "${var.region}"
}

module "vpc" {
    source = "./modules/vpc"
    cidr = "${var.cidr}"
    create_vpc = "${var.create_vpc}"
}

module "subnet" {
    source = "./modules/subnet"
    create_vpc = "${var.create_vpc}"
    pub_cidr = "${var.pub_cidr}"
    priv_cidr = "${var.priv_cidr}"
    list_az = "${var.list_az}"
    vpc_id = "${module.vpc.vpc_id}"
}

module "route_tables" {
    source = "./modules/route_tables"
    create_vpc = "${var.create_vpc}"
    list_az = "${var.list_az}"
    gateway_id = "${module.vpc.gw_id}"
    vpc_id = "${module.vpc.vpc_id}"
    nat_id = "${module.nat.nat_id}"
    private_rt = "${var.private_rt}"
    public_subnet_id = "${module.subnet.public_subnets}"
    private_subnet_id = "${module.subnet.private_subnets}"
    subnet_pri = "${var.subnet_pri}"
}

module "nat" {
    source = "./modules/nat"
    subnet_id_nat = "${element(module.subnet.public_subnets, 1)}"
    subnet_pub = "${element(var.subnet_pub, 1)}"
    create_vpc = "${var.create_vpc}"
    keyname = "${var.keyname}"
    list_az = "${element(var.list_az, 1)}"
    nat_ami = "${var.nat_ami}"
    vpc_id = "${module.vpc.vpc_id}"
    exist_vpc_id = "${var.exist_vpc_id}"
    cidr = "${var.cidr}"
    }
