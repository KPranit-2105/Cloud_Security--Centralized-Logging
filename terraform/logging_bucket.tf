# Terraform Centralized Audit Logging Architecture
# Organization: Apex Cloud Financial Systems (ApexPay)
# Standard Mapping: PCI-DSS v4.0 Requirement 10, NIST SP 800-92, SOC 2 CC7.2

resource "aws_kms_key" "log_kms_key" {
  description             = "KMS Key for ApexPay Central Audit Log Bucket"
  deletion_window_in_days = 30
  enable_key_rotation     = true # PCI-DSS Req 3.6.4 compliance
}

resource "aws_s3_bucket" "central_log_bucket" {
  bucket        = "apexpay-central-audit-logs-prod"
  force_destroy = false # Prevent accidental bucket destruction
}

# Enforce S3 Object Lock (Compliance Mode) for Write-Once-Read-Many (WORM) Immutability
resource "aws_s3_bucket_object_lock_configuration" "log_lock" {
  bucket = aws_s3_bucket.central_log_bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 365 # 1-year mandatory PCI-DSS log retention
    }
  }
}

# Enforce KMS SSE-KMS Server Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "log_encryption" {
  bucket = aws_s3_bucket.central_log_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.log_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Deny HTTP Access (SSL Only Enforced via Bucket Policy)
resource "aws_s3_bucket_policy" "enforce_ssl_policy" {
  bucket = aws_s3_bucket.central_log_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowSSLRequestsOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.central_log_bucket.arn,
          "${aws_s3_bucket.central_log_bucket.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
