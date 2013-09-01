jimeh = data_bag_item("users", "jimeh")

link "#{jimeh['home']}/Projects" do
  to "#{node['jimeh']['shared']}/projects"
  owner "jimeh"
  group "jimeh"
end
