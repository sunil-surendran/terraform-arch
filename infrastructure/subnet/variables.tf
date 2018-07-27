variable "create_vpc" {
  description = "Should VPC be created? (ENTER 1 for yes; 0 for no)"
}

variable "list_az" {
	description = "The Availability Zones for the template"
	type = "list"
}
variable "pub_cidr" {
  description = "CIDR for Public subnet"
	type = "list"
}   

variable "priv_cidr" {
  description = "CIDR for Private subnet"
	type = "list"
}   

variable "vpc_id" {
}
