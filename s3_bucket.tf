resource "aws_s3_bucket" "main_domain" {
  bucket        = "${ var.bucket_name }"
  acl           = "public-read"
  policy        = "${file("./modules/s3_bucket/bucket-policy.json")}"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  versioning {
    enabled = true
  }
}

variable "bucket_name" {}
