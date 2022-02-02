provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bwegfe" {
  bucket = "my-tf-test-bucketergerj"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "target-bucket"
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "good_example" {
  bucket                  = aws_s3_bucket.bwegfe.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tfsec:ignore:aws-ssm-secret-use-customer-key - No need of CMK
resource "aws_secretsmanager_secret" "pagerduty_integration_url" {
  name = "pagerduty_integration_url"
}

#tfsec:ignore:AVD-GEN-0004  - No need of CMK
resource "aws_secretsmanager_secret_version" "pagerduty_integration_url" {
  secret_id     = aws_secretsmanager_secret.pagerduty_integration_url.id
  secret_string = "invalid_value"
  lifecycle {
    ignore_changes = [secret_string]
  }
}

resource "aws_secretsmanager_secret_version" "pagerduty_integration_url" {
  secret_id     = aws_secretsmanager_secret.pagerduty_integration_url.id
  secret_string = "invalid_value"
  lifecycle {
    ignore_changes = [secret_string]
  }
}
