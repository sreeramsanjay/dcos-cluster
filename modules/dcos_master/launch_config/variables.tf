variable "centos_base_ami" {}
variable "instance_type" {}
#variable "dcos_master_security_group_id" {}
variable "mgmt_security_group_id" {}
variable "dcos_master_ec2_instance_profile" {}
variable "ssh_key_name" {}
variable "project_tag" {}
variable "uid" {
  description = "UID to re-generate resources"
  # date '+%m-%d-%Y_%H_%m_%S'
  default = "06-01-2015_18_06"
}
