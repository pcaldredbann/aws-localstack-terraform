output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "The name of the bucket"
}
