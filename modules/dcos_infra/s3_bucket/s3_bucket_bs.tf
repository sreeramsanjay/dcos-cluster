resource "aws_s3_bucket" "bs_bucket" {
  bucket = "${var.bs_bucket_name}"
  acl    = "private"

  tags {
    Name        = "dcos-bootstrap"
    Environment = "${var.project_tag}"
  }
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = "${aws_s3_bucket.bs_bucket.id}"
  policy = "${file("../../modules/dcos_infra/s3_bucket/policy.json")}"
}

output "bs_s3_bucket" {
  value = "${aws_s3_bucket.bs_bucket.id}"
}
