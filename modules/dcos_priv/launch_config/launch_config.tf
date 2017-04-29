resource "aws_launch_configuration" "priv_lc" {
  name = "${var.project_tag}-priv-agent-lc"
  lifecycle { create_before_destroy = true }
  image_id = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  #security_groups = [
  # "${var.dcos_master_security_group_id}",
  #  "${var.mgmt_security_group_id}"
  #]
  security_groups = ["sg-2304ef5d", "sg-d91af1a7"]
  #user_data = "${file("./launch_configurations/userdata.sh")}"
  key_name = "${var.ssh_key_name}"
  #iam_instance_profile = "${var.dcos_master_ec2_instance_profile}"
  iam_instance_profile = "dcos_agent_ec2_instance_profile"
}
output "priv_agent_lc_id" {
  value = "${aws_launch_configuration.priv_lc.id}"
}
output "priv_agent_lc_name" {
  value = "${aws_launch_configuration.priv_lc.name}"
}
