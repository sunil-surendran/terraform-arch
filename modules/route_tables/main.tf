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
