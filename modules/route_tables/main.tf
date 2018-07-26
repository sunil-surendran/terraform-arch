resource "aws_route_table" "public_route_table" {
   count  = "${var.create_vpc ? 1 : 0}"
   vpc_id = "${var.vpc_id}"
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = "${var.gateway_id}"
   }
   tags {
     Name = "public_route_table"
   }
}

resource "aws_route_table" "private_route_table" {
  count  = "${var.create_vpc ? 1 : 0}"
  vpc_id = "${var.vpc_id}"
  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${var.nat_id}"
  }
  tags {
    Name = "private_route_table"
  }
}

# Private route for existing resource
resource "aws_route" "private_r" {
  count                  = "${var.create_vpc ? 0 : 1}"
  route_table_id         = "${var.private_rt}"
  instance_id            = "${var.nat_id}"
  destination_cidr_block = "0.0.0.0/0"
}

# SUBNET-ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "public_route" {
  count          = "${var.create_vpc==1 ? length(var.list_az) : 0 }"
#  subnet_id      = "${element(concat(aws_subnet.public.*.id, list("") ), count.index)}"
  subnet_id      = "${element(var.public_subnet_id, count.index)}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "private_route" {
  count = "${length(var.list_az)}"
  subnet_id = "${var.create_vpc==1 ? element(var.private_subnet_id, count.index) : element(var.subnet_pri, count.index)}"
  route_table_id = "${var.create_vpc==1 ? join("",  aws_route_table.private_route_table.*.id) : var.private_rt}"
}
