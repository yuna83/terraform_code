variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "vpc_id" {
  type    = string
  default = "vpc-08c871b45f2fb9903"
}

variable "public_subnet_id" {
  type    = list(any)
  default = ["subnet-04e0725a94c6e2f31", "subnet-00d4d63f5648153ea"]
}

variable "private_subnet_id" {
  type    = list(any)
  default = ["subnet-048642e95bc5304e8", "subnet-07eab9aba36633253"]

}
