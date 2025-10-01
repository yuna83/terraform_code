variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "prefix" {
  type    = string
  default = "user08"
}

variable "ami_id" {
  type    = string
  default = "ami-0845ee48fd22cc61a"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "user08-key"
}