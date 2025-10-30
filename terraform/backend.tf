terraform {
  backend "s3" {
    bucket         = "epicbook-s3-bucket-aj"   # Replace with your S3 bucket name
    key            = "flaskapp/terraform.tfstate" # Path inside the bucket
    region         = "us-east-1"                  # Your AWS region
    dynamodb_table = "terraform-locks"           # For state locking
    encrypt        = true
  }
}
