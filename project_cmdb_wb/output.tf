output "public_instance_ip" {
  value = ["${aws_instance.NSRA_CMDB_WEB.public_ip}"]
}
