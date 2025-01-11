provider "aws" {
  region = "ap-south-1"
  #   access_key = ""
  #   secret_key = "" 
}

resource "aws_instance" "intro" {
  ami                    = "ami-0e670eb768a5fc3d4"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  key_name               = "demo-terraform"
  vpc_security_group_ids = ["sg-08be2f03824940936"]
  tags = {
    Name        = "Demo-Instance-Terraform"
    Environment = "Terraform"
  }
}
