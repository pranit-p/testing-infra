resource "aws_s3_bucket" "b" {
  bucket = "testing0-s3-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}