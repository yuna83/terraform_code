resource "aws_instance" "user08-web" {
  ami                    = "ami-077ad873396d76f6a" // Amazon Linux 2023 kernel-6.1
  instance_type          = "t2.micro"
  subnet_id              = var.private_subnet_id[0]
  vpc_security_group_ids = ["sg-063dd176b16df0b64", "sg-08ecefef69ce3e02a", "sg-051b6bfb75eb3714d"]
  key_name               = "user08-key"

  tags = {
    Name = "user08-web"
  }
}
