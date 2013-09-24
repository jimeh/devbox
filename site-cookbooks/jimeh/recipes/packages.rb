#
# Common system packages
#

package "htop"
package "texinfo"
package "libarchive-zip-perl"


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
