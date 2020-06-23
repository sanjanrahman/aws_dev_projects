output "vpc_id" {
  value = "${aws_vpc.NSRA-tools-Workload.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.NSRA-Tools-Workload-TCEShared.id}"
}

output "NSRA-WL-Webapps-SSH_id" {
  value = ["${aws_security_group.NSRA-WL-Webapps-SSH.id}"]
}

output "NSRA-WL-Webapps-TLS_id" {
  value = ["${aws_security_group.NSRA-WL-Webapps-TLS.id}"]
}
