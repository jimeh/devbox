jimeh = data_bag_item("users", "jimeh")
root_path = "#{node["jimeh"]["shared"]}/dotfiles"

bash "jimeh-symlink_dotfiles" do
  code "#{root_path}/install.sh links"
  cwd root_path
  user "jimeh"
  group "jimeh"
  environment "HOME" => jimeh["home"]
end
