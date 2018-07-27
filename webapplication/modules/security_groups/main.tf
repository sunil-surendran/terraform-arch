resource "aws_security_group" "bastion_security" {
  name        = "bastion_security"
  description = "Allow SSH access to bastion"
  vpc_id      = "${var.create_vpc==1 ? var.vpc_id : var.exist_vpc_id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.secure_ip}"]
  }
  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }
  tags {
    Name = "sunil_bastion_sg"
  }
}

