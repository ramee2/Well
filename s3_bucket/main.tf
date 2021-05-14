resource "aws_s3_bucket" "testlog_bucket12_01" {
  bucket_prefix = "terraform"
  acl           = "log-delivery-write"
}

resource "aws_s3_bucket" "b" {
  bucket_prefix = "terraform-test"
  acl           = "private"

  versioning {
    enabled = var.versioning
  }


  logging {
    target_bucket = aws_s3_bucket.testlog_bucket12_01.id
    target_prefix = var.target_prefix
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_master_key_id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }

  tags = var.tags
}
