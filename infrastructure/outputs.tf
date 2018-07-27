#output "elb_dns" {
#	value = ["${aws_elb.sunil_elb.dns_name}"]
#}

output "vpd_id" {
    value = "${module.vpc.vpd_id}"
}
