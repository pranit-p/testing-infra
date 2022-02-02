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
  bucket              = aws_s3_bucket.bwegfe.id
  block_public_acls   = true
  block_public_policy = true
}

