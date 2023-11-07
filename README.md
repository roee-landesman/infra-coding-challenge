# Terraform Coding Challenge

Welcome to Envoy! This fake site is a simple terraform setup that creates a static website hosted on S3. We will use this terraform code and localstack to test your ability to write terraform code and test it locally.

To begin, please clone this github repo and run the following commands:

``` bash
make install
tflocal init
tflocal apply
```

## Questions

Questions:
    1. Can you explain the purpose of `depends_on` and its usage in Terraform configurations? Could you remove this line and still have a working terraform configuration?
    2. If you were to write a CI pipeline that deploys this code, how would you design this pipeline? What other tools might you use to ensure the integrity and security of this code?
    3. Given that we want to expand to another environment (think Staging or Dev), how would you refactor or modify this code to achieve this?
    4. How would you modify this code to allow for a different S3 bucket name in each environment?

## Challenges

1. Let's modify this code so that we have a staging environment hosted at `http://envoy-dogs-internal.s3-website.localhost.localstack.cloud:4566`.
2. Given the locals block for user/permissions, uncomment the code and complete it `policies.tf`
3. How would you build a system that allows users to self-serve IAM permissions for their own terraform deployments? What tools would you use to build this system?
