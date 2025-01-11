resource "aws_instance" "demo-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "demo-terraform"
  vpc_security_group_ids = ["sg-08be2f03824940936"]
  tags = {
    Name        = "Demo-Instance-Terraform"
    Environment = "Terraform"
  }

}