resource "aws_s3_bucket" "ecommerce" {
bucket = "${var.project_name}-${var.environment}-storage-406579089625"

  tags = {
    Name        = "${var.project_name}-${var.environment}-storage-406579089625"
    Environment = var.environment
    Project     = var.project_name
  }
}

