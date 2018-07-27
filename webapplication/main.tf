provide "aws" {
    region = "${var.region}"
    }

module "security_groups" {
    source = ./modules/security_groups
    create_vpc = "${var.create_vpc}"
    vpc_id = "${var.vpc_id}"
    exist_vpc_id = "${var.exist_vpc_id}"
    secure_ip = "${var.secure_ip}"
    }
