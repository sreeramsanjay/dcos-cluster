variable "region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-c8a4b3ae"
}
variable "vpc_cidr" {
  default = "10.220.16.0/22"
}
variable "ssh_source_cidr_block" {
  default = "1.1.1.6/32"
}
variable "availability_zones" {
  type = "list"
  default = ["us-east-1c", "us-east-1d"]
}
variable "project_tag" {
  default = "IaaS-Pilot"
}
variable "master_ec2_instance_profile_name" {
   default = "dcos_master_ec2_instance_profile"
}
variable "master_iam_role_policy_name" {
   default = "dcos_master_policy"
}
variable "master_iam_role_name" {
   default = "dcos_master_role"
}
variable "agent_ec2_instance_profile_name" {
   default = "dcos_agent_ec2_instance_profile"
}
variable "agent_iam_role_policy_name" {
   default = "dcos_agent_policy"
}
variable "agent_iam_role_name" {
   default = "dcos_agent_role"
}
