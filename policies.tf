# resource "aws_iam_role" "env_role" {
#   for_each = local.permissions

#   name = ROLE_NAME_HERE
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action = "sts:AssumeRole",
#         Effect = "Allow",
#         Principal = {
#           AWS = [for user in each.value.users : "arn:aws:iam::ACCOUNT_NUMBER_HERE:user/${user}"]
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_policy" "env_policy" {
#   for_each = local.permissions

#   name   = "policy-${each.key}-BUCKET_NAME_HERE"
#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Action   = each.value.permissions,
#         Resource = "arn:aws:s3:::${local.bucket_name}/*",
#         Effect   = "Allow"
#       },
#       {
#         Action   = "s3:ListBucket",
#         Resource = "arn:aws:s3:::${local.bucket_name}",
#         Effect   = "Allow"
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "env_policy_attach" {
#   for_each = local.permissions

#   role       = aws_iam_role.env_role[each.key].name
#   policy_arn = aws_iam_policy.env_policy[each.key].arn
# }
