variable "accessKey" {
  type        = "string"
  description = "AWS access key id"
  default     = "missing"
}

variable "secretKey" {
  type        = "string"
  description = "AWS access secret key"
  default     = "missing"
}

variable "region" {
  default = "us-east-1"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default     = "ami-0c322300a1dd5dc79"
}

variable "instance_type" {
  description = "type for aws EC2 instance"
  type        = "map"

  default = {
    default = "t2.micro"
    dev     = "t2.micro"
    preprod = "t2.large"
  }
}

variable "environment_tag" {
  description = "Environment tag"
 type        = "map"

  default = {
    default = "default"
    dev     = "dev"
    preprod = "preprod"
  }
}
