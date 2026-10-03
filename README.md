# Terraform EC2: Dev and QA

Reusable Terraform module to create one EC2 instance in each of two environments.
Terraform state is stored remotely in S3, with S3 native lock files. GitHub Actions
runs on an existing EC2 self-hosted runner using its attached IAM instance profile.

## Before you start

1. Use an existing VPC, subnet, and security group for each environment.
2. Create an S3 bucket for Terraform state. Enable versioning, encryption, and block public access.
3. Replace `REPLACE_WITH_YOUR_STATE_BUCKET` in both `backend.tf` files with the bucket name.
4. Copy each `terraform.tfvars.example` to `terraform.tfvars` and set the correct subnet and security group IDs.
5. Ensure the runner's IAM role can access the state bucket (including `.tflock` objects) and manage the EC2 resources. The role must also have permission to describe the Ubuntu AMI.
6. Ensure Terraform and AWS CLI are installed on the runner and that `aws sts get-caller-identity` succeeds.

The state bucket must exist before `terraform init`. Do not commit real credentials or sensitive state files.

## Run locally on the runner

For Dev:

```bash
cd environments/dev
terraform init
terraform fmt -check
terraform validate
terraform plan
# Review the plan, then:
terraform apply
```

For QA, run the same commands from `environments/qa`.

## GitHub Actions

Push this repository to GitHub. In Actions, select **Terraform EC2 Deployment** and choose:
- `dev` or `qa`
- `plan` or `apply`

The workflow uses the EC2 runner's instance profile; no AWS access keys are configured in GitHub.

## Notes

- Dev uses `t3.micro` and a 20 GiB encrypted gp3 root volume.
- QA uses `t3.small` and a 30 GiB encrypted gp3 root volume.
- Both instances have public IP assignment disabled.
- The workflow's `apply` uses the plan generated earlier in that same run. Add GitHub environment approvals and pin third-party actions to verified commit SHAs for stronger controls.
- The example assumes both environments are in the AWS account accessible to the runner. For separate accounts, configure explicit role assumption.
