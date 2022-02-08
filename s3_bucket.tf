# resource "aws_s3_bucket" "b" {
#   bucket = "testing0-s3-bucket"
#   acl    = "private"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_secretsmanager_secret_version" "for_testing_integration_url" {
#   secret_id     = aws_secretsmanager_secret.pagerduty_integration_url.id
#   secret_string = "invalid_value"
#   lifecycle {
#     ignore_changes = [secret_string]
#   }
# }
