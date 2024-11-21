output "vpc_id" {
  value = aws_vpc.mainnet_vpc.id
}

output "subnets" {
  value = { for i in aws_subnet.public_subnets : i.availability_zone => i.id }
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.transit_gateway.id
}

output "transit_gateway_account_id" {
  value = aws_ec2_transit_gateway.transit_gateway.owner_id 
}

output "transit_gateway_route_table_id" {
  value = data.aws_ec2_transit_gateway_route_table.transit_gateway_route_table.id
}

output "key_name" {
  value = aws_key_pair.key-pair.key_name
}

output "eip_allocation_ids" {
  value = [ for i in aws_eip.mainnet-node-eip : i.allocation_id ]
}