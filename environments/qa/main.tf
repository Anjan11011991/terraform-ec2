provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "qa_ec2" {
  source = "../../modules/ec2"

  ami_id              = data.aws_ami.ubuntu.id
  instance_type       = var.instance_type
  subnet_id           = var.subnet_id
  security_group_ids  = var.security_group_ids
  instance_name       = "qa-server"
  environment         = "qa"
  root_volume_size    = 30
  associate_public_ip = false
}
