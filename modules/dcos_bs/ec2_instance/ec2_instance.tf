resource "aws_instance" "instance" {
  ami = "${var.centos_base_ami}"
  instance_type = "${var.instance_type}"
  tags = {
    Name = "${var.project_tag}-${var.node_name}"
  }
  subnet_id = "${var.private_subnet_id}"
  vpc_security_group_ids = ["${var.sec_grp_list}"]
  key_name = "${var.ssh_key_name}"
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y epel-release",
      "sudo yum install -y ansible",
    ]
    connection {
	type = "ssh"
        user = "centos"
        private_key = "${file("/home/centos/genconf/ssh-key")}"
    }
  }
}

