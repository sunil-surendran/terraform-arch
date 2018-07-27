#output "elb_dns" {
#	value = ["${aws_elb.sunil_elb.dns_name}"]
#}

output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
