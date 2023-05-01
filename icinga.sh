rpm --import https://packages.icinga.com/icinga.key
wget https://packages.icinga.com/centos/ICINGA-release.repo -O /etc/yum.repos.d/ICINGA-release.repo
yum install epel-release
yum install icinga2
systemctl enable icinga2
systemctl start icinga2
icinga2 daemon -C
yum install nagios-plugins-all
icinga2 api setup
systemctl restart icinga2
yum install icingadb-redis
systemctl enable --now icingadb-redis
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/icingadb-redis/icingadb-redis.conf
systemctl restart icingadb-redis
icinga2 feature enable icingadb
systemctl restart icinga2

