variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  description = "Existing subnet ID"
  type        = string
  default     = "subnet-050c0054003a446ca"
}

variable "security_group_ids" {
  description = "Existing security group ID"
  type        = list(string)
  default     = ["sg-03d7f706f90113dcd"]
}