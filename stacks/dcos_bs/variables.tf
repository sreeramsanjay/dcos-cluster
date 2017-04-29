variable "region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-a3123fc5"
}
variable "vpc_cidr" {
  default = "10.220.16.0/22"
}
variable "ssh_source_cidr_block" {
  default = ["0.0.0.0/0"]
}
variable "availability_zones" {
  type = "list"
  default = ["us-east-1c", "us-east-1d"]
}
variable "private_subnet_id" {
  default = "subnet-fcc71cb4"
}
variable "centos_base_ami" {
  default = "ami-47096750"
}
variable "project_tag" {
  default = "IaaS-Pilot"
}
variable "ssh_key_name" {
  default = "RACONAWS"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "node_name" {
  default = "bootstrap"
}
variable "bucket_name" {
  default = "iaas_pilot_bs"
}
variable "mgmt_security_group_id" {
  default = "sg-2304ef5d"
}
