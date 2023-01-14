resource "aws_s3_bucket" "backend_bucket" {
  bucket        = "tomcat-tf-ansible-state"
}
resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.backend_bucket.id
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "tomcat-dynamodb-state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table for tomcat project"
    }
}