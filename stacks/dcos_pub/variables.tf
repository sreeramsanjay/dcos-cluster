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
variable "priv_agent_subnet_id" {
  type = "list"
  default = ["subnet-fcc71cb4", "subnet-3db45367"]
}
variable "pub_agent_subnet_id" {
  type = "list"
  default = ["subnet-fcc71cb4", "subnet-3db45367"]
}
variable "centos_base_ami" {
  default = "ami-6d1c2007"
}
variable "project_tag" {
  default = "IaaS-Pilot"
}
variable "ssh_key_name" {
  default = "RACONAWS"
}
variable "instance_type" {
  default = "m4.large"
}
variable "mgmt_security_group_id" {
 default = "sg-c60c33b9"
}
#get below parameter from dcos_infra stack
variable "private_ec2_instance_profile" {
 default = "dcos_master_ec2_instance_profile"
}
variable "master_ec2_instance_profile" {
 default = "dcos_agent_ec2_instance_profile"
}
variable "elb_security_group_id" {
 default = "sg-05b65b7b"
}
variable "master_security_group_id" {
 default = "sg-4cb35e32"
}
variable "pub_security_group_id" {
 default = "sg-32b15c4c"
}
variable "priv_security_group_id" {
 default = "sg-4db35e33"
}
variable "asg_min" {
  default = "1"
}
variable "asg_max" {
  default = "1"
}
