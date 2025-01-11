resource "aws_key_pair" "demo-key" {
  key_name   = "demo-terraform-1"
  public_key = file("demo-terraform-1.pub")
}

resource "aws_instance" "demo-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.demo-key.key_name
  vpc_security_group_ids = ["sg-08be2f03824940936"]
  tags = {
    Name        = "Demo-Instance-Terraform"
    Environment = "Terraform"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("demo-terraform-1")
    host        = self.public_ip
  }
}