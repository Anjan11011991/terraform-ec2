terraform {
  backend "s3" {
    bucket       = "terraform-s3-2026-13"
    key          = "dev/ec2/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}
