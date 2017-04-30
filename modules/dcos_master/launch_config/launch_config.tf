resource "aws_launch_configuration" "master_lc" {
  name = "${var.project_tag}-master-lc-v3"
  lifecycle { create_before_destroy = true }
  image_id = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  #security_groups = [
  # "${var.dcos_master_security_group_id}",
  #  "${var.mgmt_security_group_id}"
  #]
  security_groups = ["sg-2304ef5d", "sg-a206eddc"]
  user_data = "${file("./userdata.sh")}"
  key_name = "${var.ssh_key_name}"
  #iam_instance_profile = "${var.dcos_master_ec2_instance_profile}"
  iam_instance_profile = "dcos_master_ec2_instance_profile"
}
output "master_lc_id" {
  value = "${aws_launch_configuration.master_lc.id}"
}
output "master_lc_name" {
  value = "${aws_launch_configuration.master_lc.name}"
}
