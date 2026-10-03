terraform {
  backend "s3" {
    bucket       = "terraform-s3-2026-13-qa"
    key          = "qa/ec2/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}
