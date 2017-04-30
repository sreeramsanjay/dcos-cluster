setenforce 0 && \
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
# sudo yum -y update --exclude="docker-engine*"
mkdir -p /etc/systemd/system/docker.service.d
tee /etc/systemd/system/docker.service.d/override.conf <<- EOF
[Service]
Restart=always
StartLimitInterval=0
RestartSec=15
ExecStartPre=-/sbin/ip link del docker0
ExecStart=
ExecStart=/usr/bin/docker daemon --storage-driver=overlay -H fd://
EOF
yum install -y docker-engine-1.11.2
systemctl start docker
systemctl enable docker
yum install -y wget
yum install -y git
yum install -y unzip
yum install -y curl
yum install -y xz
yum install -y ipset
yum install -y ntp
systemctl enable ntpd
systemctl start ntpd
getent group nogroup || groupadd nogroup
touch /opt/dcos-prereqs.installed
