resource "aws_s3_bucket" "zk_bucket" {
  bucket = "${var.zk_bucket_name}"
  acl    = "private"

  tags {
    Name        = "dcos-zk-exhbitor"
    Environment = "${var.project_tag}"
  }
}

output "zk_s3_bucket" {
  value = "${aws_s3_bucket.zk_bucket.name}"
}

