variable "prefix" {
  description = "资源名称前缀"
  type = string
}

# AWS
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

# SSH
variable "ssh_public_key" {
  description = "用于登录ssh的公钥名称"
  type = string
}

variable "key_name" {
  description = "ssh key name"
  type = string
}

# VPC
variable "aws_zones" {
  description = "子网所在的可用区"
  type = list(object({
    zone = string
    cidr = string
  }))
}

variable "vpc_cidr" {
  description = "vpc的IP地址范围"
  type = string
}

# 路由表
variable "peer_cidrs" {
  description = "路由表相关"
  type = list(string)
}

# EIP
variable "max_nodes" {
  description = "需要申请的eip数量"
  type = number
}
