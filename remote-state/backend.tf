# https://dev.to/bhusein/configuring-terraform-backend-with-aws-s3-and-dynamodb-state-locking-96l

resource "aws_s3_bucket" "terraform-backend-bucket" {
  bucket = "backend-bucket-iac-terraform"


  tags = {
    Name        = "tf-bucket"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform-backend-bucket.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
