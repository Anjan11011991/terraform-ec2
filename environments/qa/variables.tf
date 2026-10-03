variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "subnet_id" {
  description = "Existing subnet ID for QA"
  type        = string
}

variable "security_group_ids" {
  description = "Existing security group IDs for QA"
  type        = list(string)
}
