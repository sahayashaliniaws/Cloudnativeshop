output "s3_bucket_name" {
  description = "Name of the E-Commerce S3 bucket"
  value       = aws_s3_bucket.ecommerce.bucket
}
