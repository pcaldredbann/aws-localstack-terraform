resource "aws_s3_bucket" "this" {
  # unfortunately bucket names MUST be globally unique across 
  # ALL buckets for ALL customer, so better to use a prefix
  bucket_prefix = var.context_name
}

resource "aws_iam_role" "this" {
  name = aws_s3_bucket.this.bucket

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy_document" "read" {
  statement {
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "write" {
  statement {
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}
