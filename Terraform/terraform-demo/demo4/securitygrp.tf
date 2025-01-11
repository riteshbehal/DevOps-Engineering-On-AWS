resource "aws_security_group" "demo_terraform_sg" {
  vpc_id      = aws_vpc.demo.id
  name        = "demo-terraform-sg"
  description = "Security Group for demo ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.Anywhere-IPv4]
  }
  tags = {
    Name = "allow-ssh"
  }
}
