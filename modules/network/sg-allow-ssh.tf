resource "aws_security_group" "NSRA-WL-Webapps-SSH" {
  name   = "NSRA-WL-Webapps-SSH"
  vpc_id = "${aws_vpc.NSRA-tools-Workload.id}"

  # SSH access from the VPC
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
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
    Name = "NSRA-sg-22-TF"
  }
}
