resource "aws_security_group" "NSRA-WL-Webapps-TLS" {
  name   = "NSRA-WL-Webapps-TLS"
  vpc_id = "${aws_vpc.NSRA-tools-Workload.id}"

  # SSH access from the VPC
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "NSRA-sg-443-TF"
  }
}
