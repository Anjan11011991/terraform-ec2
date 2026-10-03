terraform {
  backend "s3" {
    bucket       = "REPLACE_WITH_YOUR_STATE_BUCKET"
    key          = "qa/ec2/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
