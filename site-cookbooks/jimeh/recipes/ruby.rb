#
# System dependencies
#

# required by capybara-webkit gem
package "libqt4-dev"

# required by mysql2 gem
package "libmysql-ruby"
package "libmysqlclient-dev"


#
# rbenv & Ruby installation
#

include_recipe "ruby_build"
include_recipe "rbenv::user"
