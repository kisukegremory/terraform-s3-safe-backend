resource "random_id" "this" {
  byte_length = 8
}

resource "aws_s3_bucket" "terraform_states_bucket" {
  bucket = "terraform-tfstates-${random_id.this.hex}"
  force_destroy = false # to not affect other projects!
  tags = {
    managedBy = "Terraform"
    team = "me and myself and I"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.terraform_states_bucket.id
  versioning_configuration {
    status = "Enabled" # To we not lose any version of the states
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.terraform_states_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}