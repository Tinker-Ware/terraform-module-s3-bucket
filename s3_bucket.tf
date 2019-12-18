resource "aws_s3_bucket" "domain_bucket" {
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

output "s3_bucket" {
  value = "${ aws_s3_bucket.domain_bucket }"
}

variable "bucket_name" {}
