variable "REGION" {
  default = "ap-south-1"
}

variable "ZONE1" {
  default = "ap-south-1a"
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