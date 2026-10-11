terraform {
  backend "s3" {
    bucket       = "test-11-10-2026-anjan"
    key          = "dev/ec2/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = false
  }
}
