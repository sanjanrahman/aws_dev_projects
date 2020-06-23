#resources
resource "aws_vpc" "NSRA-tools-Workload" {
  cidr_block           = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "NSRA-tools-Workload-TF"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.NSRA-tools-Workload.id}"

  tags {
    Name = "NSRA-IGW-TF"
  }
}

resource "aws_subnet" "NSRA-Tools-Workload-TCEShared" {
  vpc_id                  = "${aws_vpc.NSRA-tools-Workload.id}"
  cidr_block              = "${var.cidr_subnet}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.availability_zone}"

  tags {
    Name = "NSRA-public_subnet-TF"
  }
}

resource "aws_route_table" "NSRA-TOOLS-WL-Routes" {
  vpc_id = "${aws_vpc.NSRA-tools-Workload.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "NSRA-rt-TF"
  }
}

resource "aws_route_table_association" "rta_NSRA-Tools-Workload-TCEShared" {
  subnet_id      = "${aws_subnet.NSRA-Tools-Workload-TCEShared.id}"
  route_table_id = "${aws_route_table.NSRA-TOOLS-WL-Routes.id}"
}
