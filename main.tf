# Terraform configuration

resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "object_www" {
  depends_on   = [aws_s3_bucket.s3_bucket]
  for_each     = fileset("${path.root}", "www/*.html")
  bucket       = local.bucket_name
  key          = basename(each.value)
  source       = each.value
  etag         = filemd5("${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "object_images" {
  depends_on = [aws_s3_bucket.s3_bucket]
  for_each   = fileset("${path.root}", "www/images/*.png")
  bucket     = local.bucket_name
  key        = basename(each.value)
  source     = each.value
  etag       = filemd5("${each.value}")
  acl        = "public-read"
}

resource "aws_s3_bucket_object" "object_css" {
  depends_on   = [aws_s3_bucket.s3_bucket]
  bucket       = local.bucket_name
  key          = "styles.css"
  source       = "www/styles.css"
  etag         = filemd5("www/styles.css")
  acl          = "public-read"
  content_type = "text/css"
}

resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.s3_bucket.arn,
          "${aws_s3_bucket.s3_bucket.arn}/*",
        ]
      },
    ]
  })
}
