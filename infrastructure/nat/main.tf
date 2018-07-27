resource "aws_instance" "sunil_nat" {
   ami                    = "${var.nat_ami}"
   availability_zone      = "${var.list_az}"
   instance_type          = "t2.micro"
   key_name               = "${var.keyname}"
   source_dest_check      = "false"
   vpc_security_group_ids = ["${aws_security_group.nat_security.id}"]
   subnet_id              = "${var.create_vpc==1 ? var.subnet_id_nat : var.subnet_pub}"
   associate_public_ip_address = "true"
   tags {
     Name           = "sunil_nat"
     Owner          = "sunil.surendran"
     ExpirationDate = "2018-07-30"
     Project        = "Learning"
     Environment    = "Testing"
   }
}

 resource "aws_security_group" "nat_security" {
   name        = "nat_security"
   description = "Access to internet for private instance"
#   vpc_id      = "${var.create_vpc==1 ? var.vpc_id : var.exist_vpc_id}"
   vpc_id      = "${var.create_vpc==1 ? var.vpc_id : var.exist_vpc_id}"
   ingress {
     from_port = 22
     to_port   = 22
     protocol  = "tcp"
     cidr_blocks = ["${var.cidr}"]
   }
   ingress {
     from_port = 80
     to_port   = 80
     protocol  = "tcp"
     cidr_blocks = ["${var.cidr}"]
   }
   ingress {
     from_port       = 0
     to_port         = 0
     protocol        = -1
#     security_groups = ["${aws_security_group.webserver_security.id}"]
   }
   egress {
     protocol    = -1
     cidr_blocks = ["0.0.0.0/0"]
     from_port   = 0
     to_port     = 0
   }
   tags {
     Name = "sunil_nat_sg"
   }
 }

