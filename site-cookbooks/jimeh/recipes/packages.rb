#
# Common system packages
#

package "htop"
package "texinfo"
package "libarchive-zip-perl"
package "build-essential"

# Some build tools want a gcc-4.2 binary in specific locations >_<
link("/usr/bin/gcc-4.2")       { to "/usr/bin/gcc" }
link("/usr/local/bin/gcc-4.2") { to "/usr/bin/gcc" }


#
# Personal favorites
#

include_recipe "git"
include_recipe "tmux::_source"
include_recipe "docker-ubuntu"
include_recipe "emacs24-ppa"
include_recipe "heroku-toolbelt"
include_recipe "ruby_build"
include_recipe "rbenv::user"
include_recipe "mysql"
