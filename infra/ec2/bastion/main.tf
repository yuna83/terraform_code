resource "aws_instance" "user08-bastion" {
  ami                    = "ami-077ad873396d76f6a" // Amazon Linux 2023 kernel-6.1
  instance_type          = "t2.micro"
  subnet_id              = var.public_subnet_id[0]
  vpc_security_group_ids = ["sg-063dd176b16df0b64"] // ssh-accept 만!
  key_name               = "user08-key"
  associate_public_ip_address = true

  tags = {
    Name = "user08-bastion"
  }
}
