rpm --import https://packages.icinga.com/icinga.key
wget https://packages.icinga.com/centos/ICINGA-release.repo -O /etc/yum.repos.d/ICINGA-release.repo
yum install icingadb
innodb_file_format=barracuda
innodb_file_per_table=1
innodb_large_prefix=1
# mysql -u root -p

CREATE DATABASE icingadb;
CREATE USER 'icingadb'@'localhost' IDENTIFIED BY 'CHANGEME';
GRANT ALL ON icingadb.* TO 'icingadb'@'localhost';
mysql -u root -p icingadb </usr/share/icingadb/schema/mysql/schema.sql
# su -l postgres

createuser -P icingadb
createdb -E UTF8 --locale en_US.UTF-8 -T template0 -O icingadb icingadb
psql icingadb <<<'CREATE EXTENSION IF NOT EXISTS citext;'