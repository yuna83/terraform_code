//VPC 생성
resource "aws_vpc" "user08-vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "user08-vpc"
  }
}

// 퍼블릭 서브넷 생성
resource "aws_subnet" "user08-public01" {
  vpc_id            = aws_vpc.user08-vpc.id
  cidr_block        = var.public_subnet_cidr[0]
  availability_zone = var.azs[0]

  tags = {
    Name = "user08-public01"
  }
}

resource "aws_subnet" "user08-public02" {
  vpc_id            = aws_vpc.user08-vpc.id
  cidr_block        = var.public_subnet_cidr[1]
  availability_zone = var.azs[1]

  tags = {
    Name = "user08-public02"
  }
}

// 프라이빗 서브넷 생성
resource "aws_subnet" "user08-private01" {
  vpc_id            = aws_vpc.user08-vpc.id
  cidr_block        = var.private_subnet_cidr[0]
  availability_zone = var.azs[0]

  tags = {
    Name = "user08-private01"
  }
}

resource "aws_subnet" "user08-private02" {
  vpc_id            = aws_vpc.user08-vpc.id
  cidr_block        = var.private_subnet_cidr[1]
  availability_zone = var.azs[1]

  tags = {
    Name = "user08-private02"
  }
}

//인터넷 게이트웨이 생성
resource "aws_internet_gateway" "user08-igw" {
  vpc_id = aws_vpc.user08-vpc.id

  tags = {
    Name = "user08-igw"
  }
}

// EIP 생성
resource "aws_eip" "user08-eip" {
  domain = "vpc"
  #depends_on = ["aws_internet_gateway.user08-igw"]
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "user08-eip"
  }
}

// NAT 게이트웨이 생성
resource "aws_nat_gateway" "user08-nat-gw" {
  allocation_id = aws_eip.user08-eip.id
  subnet_id     = aws_subnet.user08-public01.id
  depends_on    = ["aws_internet_gateway.user08-igw"]

  tags = {
    Name = "user08-nat-gw"
  }
}

// 퍼블릭 라우팅 테이블 생성
resource "aws_default_route_table" "user08-public-rt" {
  default_route_table_id = aws_vpc.user08-vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.user08-igw.id
  }

  tags = {
    Name = "user08-public-rt"
  }
}

// 퍼블릭 서브넷1 과 라우팅 테이블 연결
resource "aws_route_table_association" "user08-public01-rt-assoc" {
  subnet_id      = aws_subnet.user08-public01.id
  route_table_id = aws_default_route_table.user08-public-rt.id
}

// 퍼블릭 서브넷2 와 라우팅 테이블 연결
resource "aws_route_table_association" "user08-public02-rt-assoc" {
  subnet_id      = aws_subnet.user08-public02.id
  route_table_id = aws_default_route_table.user08-public-rt.id
}

// 프라이빗 라우팅 테이블 생성
resource "aws_route_table" "user08-private-rt" {
  vpc_id = aws_vpc.user08-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.user08-nat-gw.id
  }

  tags = {
    Name = "user08-private-rt"
  }
}

// 프라이빗 서브넷1 과 라우팅 테이블 연결
resource "aws_route_table_association" "user08-private01-rt-assoc" {
  subnet_id      = aws_subnet.user08-private01.id
  route_table_id = aws_route_table.user08-private-rt.id
}

// 프라이빗 서브넷2 와 라우팅 테이블 연결
resource "aws_route_table_association" "user08-private02-rt-assoc" {
  subnet_id      = aws_subnet.user08-private02.id
  route_table_id = aws_route_table.user08-private-rt.id
}


