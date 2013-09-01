execute "install heroku toolbelt" do
  if node['heroku-toolbelt']['standalone']
    command "wget -qO- https://toolbelt.heroku.com/install.sh | sh"
  else
    command "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
  end
  action :run
  not_if "which heroku"
end
