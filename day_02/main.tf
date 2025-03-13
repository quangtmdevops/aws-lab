
# module "ec2_instance" {
#   source        = "./modules/ec2_instance"
#   ami           = "ami-0c1907b6d738188e5" # Example AMI ID (change it to your preferred AMI)
#   instance_type = "t2.micro"
# }
#
# output "instance_id" {
#   value = module.ec2_instance.instance_id
# }
#
# output "public_ip" {
#   value = module.ec2_instance.public_ip
# }

module "ec2_with_vpc" {
  source = "./modules/ec2_with_vpc"
}

output "vpc_name" {
  value = module.ec2_with_vpc.vpc_name
}

output "vpc_id" {
  value = module.ec2_with_vpc.vpc_id
}

module "ec2_with_subnet" {
  source = "./modules/ec2_with_subnet"
  vpc_id = module.ec2_with_vpc.vpc_id
}

output "subnet_name" {
  value = module.ec2_with_subnet.public_subnet_name
}

output "subnet_id" {
  value = module.ec2_with_subnet.public_subnet_id
}