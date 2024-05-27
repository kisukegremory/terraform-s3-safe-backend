resource "aws_dynamodb_table" "tfstate_lock_table" {
  name = "tf-state-lock-table-${random_id.this.hex}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID" # Must be LockID for the terraform understand

  attribute {
    name = "LockID"
    type = "S"
  }
}