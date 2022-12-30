# CloudFormation Stack

## Requirements

- [`awscli` installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Usage

:warning: Be sure to set your AWS region to `us-east-1`.

Deploy CloudFormation stack:

```sh
aws cloudformation deploy \
    --stack-name support-access \
    --template-file template.yml \
    --parameter-overrides AccountNumber=<YOUR_ACCOUNT_NUMBER> ServiceToken=<YOUR_SERVICE_TOKEN>
```
