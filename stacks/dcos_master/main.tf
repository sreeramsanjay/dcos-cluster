terraform {
  backend "s3" {
    bucket = "aa-tf-status"
    key    = "iaas-pilot/dcos-master.tfstatus"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
module "launch_configurations" {
  source = "../../modules/dcos_master/launch_config"
  centos_base_ami = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  mgmt_security_group_id = "{var.mgmt_security_group_id}"
  dcos_master_ec2_instance_profile = "{var.master_ec2_instance_profile}"
  ssh_key_name = "${var.ssh_key_name}"
  project_tag = "${var.project_tag}"
}
module "load_balancers" {
  source = "../../modules/dcos_master/elb/"
  master_subnet_id = "${var.master_subnet_id}"
  master_elb_sg = "${var.elb_security_group_id}"
}
module "autoscaling_groups" {
  source = "../../modules/dcos_master/auto_scaling/"
  project_tag = "${var.project_tag}"
  master_subnet_id = "${var.master_subnet_id}"
  asg_min = "${var.asg_min}"
  asg_max = "${var.asg_max}"
  master_lc_id = "${module.launch_configurations.master_lc_id}"
  master_lc_name = "${module.launch_configurations.master_lc_name}"
  master_elb_name = "${module.load_balancers.master_elb_name}"
}

#output "master_elb_dns_name" {
#  value = "${module.load_balancers}"
