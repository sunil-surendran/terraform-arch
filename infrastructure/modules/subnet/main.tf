# SUBNET CONFIGURATION
resource "aws_subnet" "public" {
  count                   = "${var.create_vpc==1 ? length(var.list_az) : 0 }"
  availability_zone       = "${element(var.list_az, count.index)}"
  cidr_block              = "${element(var.pub_cidr, count.index)}"
  map_public_ip_on_launch = true
  vpc_id                  = "${var.vpc_id}"
  tags {
    Name = "sunil-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count                   = "${var.create_vpc==1 ? length(var.list_az) : 0 }"
  availability_zone       = "${element(var.list_az, count.index)}"
  cidr_block              = "${element(var.priv_cidr, count.index)}"
  map_public_ip_on_launch = false
  vpc_id                  = "${var.vpc_id}"
  tags {
    Name = "sunil-private-subnet-${count.index + 1}"
  }
}
