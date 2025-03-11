provider "aws" {
  region = "ap-southeast-1"
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  ami           = "ami-0c1907b6d738188e5"  # Example AMI ID (change it to your preferred AMI)
  instance_type = "t2.micro"
}

output "instance_id" {
  value = module.ec2_instance.instance_id
}

output "public_ip" {
  value = module.ec2_instance.public_ip
}
