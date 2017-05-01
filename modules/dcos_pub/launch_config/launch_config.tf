resource "aws_launch_configuration" "pub_lc" {
  name = "${var.project_tag}-pub-agent-lc"
  lifecycle { create_before_destroy = true }
  image_id = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  #security_groups = [
  # "${var.dcos_master_security_group_id}",
  #  "${var.mgmt_security_group_id}"
  #]
  security_groups = ["sg-2304ef5d", "sg-1619f268"]
  user_data = "${file("./userdata.sh")}"
  key_name = "${var.ssh_key_name}"
  #iam_instance_profile = "${var.dcos_master_ec2_instance_profile}"
  iam_instance_profile = "dcos_agent_ec2_instance_profile"
  root_block_device {
    volume_type = "standard"
    volume_size = 150
  }

}
output "pub_agent_lc_id" {
  value = "${aws_launch_configuration.pub_lc.id}"
}
output "pub_agent_lc_name" {
  value = "${aws_launch_configuration.pub_lc.name}"
}
