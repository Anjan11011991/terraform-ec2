variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "key_name" {
  type    = string
  default = null
}

variable "associate_public_ip" {
  type    = bool
  default = false
}

variable "root_volume_size" {
  type    = number
  default = 20
}

variable "instance_name" {
  type = string
}

variable "environment" {
  type = string
}
