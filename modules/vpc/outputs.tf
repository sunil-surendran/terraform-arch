output "vpc_id" {
	value = "${element(concat(aws_vpc.sunil-tf-vpc.*.id, list("")), 0)}"
}
