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
include_recipe "tmux::source"
include_recipe "docker-ubuntu"
include_recipe "emacs24-ppa"
include_recipe "heroku-toolbelt"


#
# Ruby and related tools
#

rbver = "1.9.3-p448"
include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

rbenv_ruby rbver

gems = ["foreman"]
gems.each do |gemname|
  rbenv_gem(gemname) { ruby_version rbver }
end
