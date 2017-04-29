resource "aws_autoscaling_group" "pub_asg" {
  lifecycle { create_before_destroy = true }
  vpc_zone_identifier = ["${var.pub_agent_subnet_id}"]
  name = "${var.project_tag}-dcos-pub-agent-asg"
  max_size = "${var.asg_max}"
  min_size = "${var.asg_min}"
  wait_for_elb_capacity = false
  force_delete = true
  launch_configuration = "${var.pub_agent_lc_id}"
  tag {
    key = "Name"
    value = "${var.project_tag}-pub-agent"
    propagate_at_launch = "true"
  }
}
