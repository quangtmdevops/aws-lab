
module "vpc" {
  source = "./modules/vpc"
}
# output "vpc_id" {
#   value = module.vpc.vpc_id
# }

# output "vpc_cidr" {
#   value = module.ec2_with_vpc.vpc_cidr_block
# }
module "subnet" {
  source = "./modules/subnet"
}

output "public_subnet_name" {
  value = module.subnet.public_subnet_name[*]
}

output "private_subnet_name" {
  value = module.subnet.private_subnet_name[*]
}

# output "subnet_id" {
#   value = module.subnet.public_subnet_id[*]
# }
# module "internet_gateway" {
#   # count = length(public_subnet_cidr)
#   source         = "./modules/intenet_gateway"
#   vpc_id         = module.ec2_with_vpc.vpc_id
#   subnet_id_list = module.ec2_with_subnet.public_subnet_id
# }
#
# output "route_table_id" {
#   value = module.internet_gateway.route_table_id
# }
#
# module "ec2_instance" {
#   source        = "./modules/ec2_instance"
#   subnet_id     = module.ec2_with_subnet.public_subnet_id[0]
#   vpc_id        = module.ec2_with_vpc.vpc_id
# }
#
# output "instance_id" {
#   value = module.ec2_instance.instance_id
# }
#
# output "public_ip" {
#   value = module.ec2_instance.public_ip
# }
#
# output "security_group_id" {
#   value = module.ec2_instance.security_group_id
# }
