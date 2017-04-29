resource "aws_iam_role" "master_iam_role" {
   name = "${var.master_iam_role_name}"
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "master_instance_profile" {
  name = "${var.master_ec2_instance_profile_name}"
  role = "${aws_iam_role.master_iam_role.name}"
}

resource "aws_iam_policy" "master_iam_policy" {
name = "${var.master_iam_role_policy_name}"
policy = "${file("../../modules/dcos_infra/ec2_profile/master_policy.json")}"
}

resource "aws_iam_policy_attachment" "master_policy" {
  name       = "${var.master_ec2_instance_profile_name}-attachment"
  roles      = ["${aws_iam_role.master_iam_role.name}"]
  policy_arn = "${aws_iam_policy.master_iam_policy.arn}"
}

output "master_ec2_instance_profile" {
  value = "${aws_iam_instance_profile.master_instance_profile.name}"
}

