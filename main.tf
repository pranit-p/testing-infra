provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bwegfe" {
  bucket = "my-tf-test-s3-buckete"
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
  bucket              = aws_s3_bucket.bwegfe.id
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_secretsmanager_secret" "pagerduty_integration_url" {
  name = "pagerduty_integration_url"
}

resource "aws_secretsmanager_secret_version" "for_testing_integration_url" {
  secret_id     = aws_secretsmanager_secret.pagerduty_integration_url.id
  secret_string = "invalid_value"
  lifecycle {
    ignore_changes = [secret_string]
  }
}
