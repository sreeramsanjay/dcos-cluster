#!/bin/bash
yum install -y epel-release
yum install -y ansible
mkdir /tmp/dcos && cd /tmp/dcos
curl -O https://s3.amazonaws.com/aamesos/mml/centos-init.aws.sh
curl -O https://s3.amazonaws.com/aamesos/dcos188/dcos_install.sh
chmod 755 /tmp/dcos/centos-init.aws.sh
chmod 755 /tmp/dcos/dcos_install.sh
bash centos-init.aws.sh
bash dcos_install.sh master
