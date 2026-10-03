terraform {
  backend "s3" {
    bucket       = "REPLACE_WITH_YOUR_STATE_BUCKET"
    key          = "dev/ec2/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
