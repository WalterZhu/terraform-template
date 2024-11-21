# 创建AWS VPC
module "aws-vpc" {
  source = "./aws-vpc"
  prefix = var.prefix

  # AWS
  aws_access_key  = var.aws_access_key
  aws_secret_key  = var.aws_secret_key
  aws_region      = var.aws_region
  aws_zones       = var.aws_zones 
}
