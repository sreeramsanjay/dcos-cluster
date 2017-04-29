resource "aws_iam_role" "agent_iam_role" {
   name = "${var.agent_iam_role_name}"
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

resource "aws_iam_instance_profile" "agent_instance_profile" {
  name = "${var.agent_ec2_instance_profile_name}"
  role = "${aws_iam_role.agent_iam_role.name}"
}

resource "aws_iam_policy" "agent_iam_policy" {
name = "${var.agent_iam_role_policy_name}"
policy = "${file("../../modules/dcos_infra/ec2_profile/agent_policy.json")}"
}

resource "aws_iam_policy_attachment" "agent_policy" {
  name       = "${var.agent_iam_role_policy_name}-attachment"
  roles      = ["${aws_iam_role.agent_iam_role.name}"]
  policy_arn = "${aws_iam_policy.agent_iam_policy.arn}"
}

output "agents_ec2_instance_profile" {
  value = "${aws_iam_instance_profile.agent_instance_profile.name}"
}

