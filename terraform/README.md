## Usage

To create IAM resources you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```


## Requirements

| Name      | Version    |
|-----------|------------|
| terraform | \>= 0.13.1 |
| aws       | \>= 4.0    |

## Providers

| Name | Version |
|------|---------|
| aws  | \>= 4.0 |

## Resources

IAM policy called "DoiT_Customer_Policy_DO-NOT-DELETE" \
IAM Role called "DoiT_Management_Role_DO-NOT-DELETE"

## Inputs

| Name          | Required |
|---------------|----------|
| account_id    | yes      |
| service_token | yes      |

## Outputs

| Name          | Description              |
|---------------|--------------------------|
| iam_role_name | The name of the IAM Role |
| iam_role_arn  | The arn of the IAM Role  |