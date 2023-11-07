# Output variable definitions

output "website_endpoint" {
  value = "http://${aws_s3_bucket.s3_bucket.id}.s3-website.localhost.localstack.cloud:4566"
}
