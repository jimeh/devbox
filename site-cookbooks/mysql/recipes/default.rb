package "mysql-server"
package "mysql-client"

# In order to support /var/lib/mysql being a shared VM directory on which
# permissions can not be changed, install initial databases into a temp
# location and then copy them into the correct one.
bash "mysql install_db" do
  code "mysql_install_db --datadir=/tmp/mysql-data; " +
    "cp -R /tmp/mysql-data/* /var/lib/mysql/; " +
    "service mysql start; " +
    "rm -rf /tmp/mysql-data"
  not_if "test -d /var/lib/mysql/mysql"
end
