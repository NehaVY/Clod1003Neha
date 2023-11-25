resource "aws_s3_bucket" "example" {
  bucket = "monringsun"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}