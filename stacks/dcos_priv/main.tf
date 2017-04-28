terraform {
  backend "s3" {
    bucket = "aa-tf-status"
    key    = "iaas-pilot/dcos-priv.tfstatus"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
module "launch_configurations" {
  source = "../../modules/dcos_priv/launch_config"
  centos_base_ami = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  mgmt_security_group_id = "{var.mgmt_security_group_id}"
  dcos_agent_ec2_instance_profile = "{var.agent_ec2_instance_profile}"
  ssh_key_name = "${var.ssh_key_name}"
  project_tag = "${var.project_tag}"
}
module "autoscaling_groups" {
  source = "../../modules/dcos_priv/auto_scaling/"
  project_tag = "${var.project_tag}"
  priv_agent_subnet_id = "${var.priv_agent_subnet_id}"
  asg_min = "${var.asg_min}"
  asg_max = "${var.asg_max}"
  priv_agent_lc_id = "${module.launch_configurations.priv_agent_lc_id}"
  priv_agent_lc_name = "${module.launch_configurations.priv_agent_lc_name}"
}

