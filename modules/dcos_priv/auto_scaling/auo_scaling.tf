resource "aws_autoscaling_group" "priv_asg" {
  lifecycle { create_before_destroy = true }
  vpc_zone_identifier = ["${var.priv_agent_subnet_id}"]
  name = "${var.project_tag}-dcos-priv-agent-asg"
  max_size = "${var.asg_max}"
  min_size = "${var.asg_min}"
  wait_for_elb_capacity = false
  force_delete = true
  launch_configuration = "${var.priv_agent_lc_id}"
  tag {
    key = "Name"
    value = "${var.project_tag}-priv-agent"
    propagate_at_launch = "true"
  }
}
