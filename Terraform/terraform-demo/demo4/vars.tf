variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
}

variable "ZONE2" {
  default = "ap-south-1b"
}

variable "ZONE3" {
  default = "ap-south-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1 = "ami-0e670eb768a5fc3d4"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "demo-terraform-1.pub"
}

variable "PRIV_KEY" {
  default = "demo-terraform-1"
}

variable "Anywhere-IPv4" {
  default = "0.0.0.0/0"
}
