# AWS
variable "vpc_cidr" {
  description = "value of vpc_cidr"
  type = string
}

variable "vpc_name" {
  description = "name of vpc"
  type = string
}

variable "aws_access_key" {
  description = "aws access key"
  type = string
}

variable "aws_secret_key" {
  description = "aws secret key"
  type = string
}

variable "aws_region" {
  description = "项目所在的aws区域"
  type = string
}

variable "aws_zone" {
  description = "项目所在的aws可用区"
  type = string
}
