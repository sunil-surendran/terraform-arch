output "vpc_id" {
	value = "${element(concat(aws_vpc.sunil-tf-vpc.*.id, list("")), 0)}"
}

output "gw_id" {
	value = "${element(concat(aws_internet_gateway.sunil-tf-igw.*.id, list("")), 0)}"
}
