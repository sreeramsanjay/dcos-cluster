terraform {
  backend "s3" {
    bucket = "aa-tf-status"
    key    = "iaas-pilot/dcos-infra.tfstatus"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
module "ec2_profile" {
  source = "../../modules/dcos_infra/ec2_profile"
  master_ec2_instance_profile_name =  "${var.master_ec2_instance_profile_name}"
  master_iam_role_policy_name  = "${var.master_iam_role_policy_name}"
  master_iam_role_name  = "${var.master_iam_role_name}"
  agent_ec2_instance_profile_name  = "${var.agent_ec2_instance_profile_name}"
  agent_iam_role_policy_name  = "${var.agent_iam_role_policy_name}"
  agent_iam_role_name  = "${var.agent_iam_role_name}"
}
module "security_groups" {
  source = "../../modules/dcos_infra/sg_dcos"
  vpc_id = "${var.vpc_id}"
  vpc_cidr = "${var.vpc_cidr}"
  ssh_source_cidr_block = "${var.ssh_source_cidr_block}"
  project_tag = "${var.project_tag}"
}
module "s3_buckets" {
 source = "../../modules/dcos_infra/s3_bucket"
 project_tag = "${var.project_tag}"
 zk_bucket_name = "${var.zk_bucket_name}"
 bs_bucket_name = "${var.bs_bucket_name}"
}
output "sg_master_id" {
  value = "${module.security_groups.master_security_group_id}"
}
output "sg_priv_id" {
  value = "${module.security_groups.priv_security_group_id}"
}
output "sg_pub_id" {
  value = "${module.security_groups.pub_agent_security_group_id}"
}
output "sg_elb_id" {
  value = "${module.security_groups.elb_security_group_id}"
}
output "sg_mgmt_id" {
  value = "${module.security_groups.mgmt_security_group_id}"
}
output "iam_master_ec2_instance_profile" {
  value = "${module.ec2_profile.master_ec2_instance_profile}"
}
output "iam_agents_ec2_instance_profile" {
  value = "${module.ec2_profile.agents_ec2_instance_profile}"
}
output "s3_zk_bucket" {
  value = "${module.s3_buckets.zk_s3_bucket}"
}
output "s3_bs_bucket" {
  value = "${module.s3_buckets.bs_s3_bucket}"
}

