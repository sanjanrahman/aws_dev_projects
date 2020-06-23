#providers
provider "aws" {
  access_key = "${var.accessKey}"
  secret_key = "${var.secretKey}"
  region     = "${var.region}"
}

#module
module "networkModule" {
  source = "../modules/network"
}

resource "aws_instance" "NSRA_CMDB_WEB" {
  ami           = "${var.instance_ami}"
  instance_type = "${lookup(var.instance_type, terraform.workspace)}"
  subnet_id     = "${module.networkModule.public_subnet_id}"
  key_name      = "NSRA-CMDB+-Key-TF"

  vpc_security_group_ids = [
    "${module.networkModule.NSRA-WL-Webapps-SSH_id}",
    "${module.networkModule.NSRA-WL-Webapps-TLS_id}",
  ]

  tags {
    Name = "NSRA-CMDB-WEB-TF"
  }
}

resource "aws_eip" "NSRA_CMDB_Ec2_EIP" {
  instance = "${aws_instance.NSRA_CMDB_WEB.id}"

  tags = {
    name = "NSRA_CMDB_Ec2_EIP"
  }
}
