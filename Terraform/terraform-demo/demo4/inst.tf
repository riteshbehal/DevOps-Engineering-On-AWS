resource "aws_key_pair" "demo-terraform-1" {
  key_name   = "demo-terraform-1"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "demo-terra" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.demo-public-1.id
  key_name               = aws_key_pair.demo-terraform-1.key_name
  vpc_security_group_ids = [aws_security_group.demo_terraform_sg.id]
  tags = {
    Name = "my-demo-instance"
  }
}

resource "aws_ebs_volume" "vol_4_demo" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-demo"
  }
}

resource "aws_volume_attachment" "atch_vol_demo" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_demo.id
  instance_id = aws_instance.demo-terra.id
}

output "PublicIP" {
  value = aws_instance.demo-terra.public_ip
}
