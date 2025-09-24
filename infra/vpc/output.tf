output "vpc_id" {
  value = aws_vpc.user08-vpc.id
}

output "user08_public01_id" {
  value = aws_subnet.user08-public01.id
}

output "user08_public02_id" {
  value = aws_subnet.user08-public02.id
}

output "user08_private01_id" {
  value = aws_subnet.user08-private01.id
}

output "user08_private02_id" {
  value = aws_subnet.user08-private02.id
}