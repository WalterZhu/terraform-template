# 创建VPC
resource "aws_vpc" "mainnet_vpc" {
  cidr_block = var.vpc_cidr 
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

# 获取VPC默认路由表
data "aws_route_table" "route_table" {
  vpc_id = aws_vpc.mainnet_vpc.id
}

# 创建子网
resource "aws_subnet" "public_subnets" {
  for_each = { for k, v in var.aws_zones : k => v }
  vpc_id = aws_vpc.mainnet_vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-public-subnet${each.key}"
  }
}

# 创建Internet Gateway
resource "aws_internet_gateway" "mainnet_internet_gateway" {
  vpc_id = aws_vpc.mainnet_vpc.id
  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

# 增加Internet Gateway路由
resource "aws_route" "router_table_internet" {
  route_table_id = data.aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.mainnet_internet_gateway.id
}

# 将子网绑定到internet路由表
resource "aws_route_table_association" "internet" {
  for_each = aws_subnet.public_subnets
  subnet_id = each.value.id
  route_table_id = data.aws_route_table.route_table.id
}

# 申请EIP
resource "aws_eip" "mainnet-node-eip" {
  count = var.max_nodes
}
