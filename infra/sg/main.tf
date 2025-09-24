// SSH 보안그룹 생성
resource "aws_security_group" "user08-ssh-accept" {
  name        = "user08-ssh-accept"
  description = "Security group to allow SSH access"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "user08-ssh-accept"
  }
}

// HTTP 보안그룹 생성
resource "aws_security_group" "user08-http-accept" {
  name        = "user08-http-accept"
  description = "Security group to allow HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "user08-http-accept"
  }
}

// HTTPS 보안그룹 생성
resource "aws_security_group" "user08-https-accept" {
  name        = "user08-https-accept"
  description = "Security group to allow HTTPS access"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "user08-https-accept"
  }
}