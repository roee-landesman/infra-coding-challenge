locals {
  bucket_name = "envoy-dogs"

  permissions = {
    "dev" = {
      account_number = "123456789012",
      users       = ["dev1", "dev2"],
      permissions = ["s3:ListBucket"]
    },
    "prod" = {
      account_number = "210987654321",
      users       = ["prod1", "prod2"],
      permissions = ["s3:ListBucket", "s3:GetObject"]
    }
  }
}
