package "libshadow-ruby1.8"

users = data_bag('users')

users.each do |login|
  attrs    = data_bag_item('users', login)
  username = attrs['username'] || login

  if !attrs['packages'].nil? && attrs['action'] != 'remove'
    attrs['packages'].each do |pkgname|
      package(pkgname) { action :install }
    end
  end

  user username do
    uid       attrs['uid']       if attrs['uid']
    gid       attrs['gid']       if attrs['gid']
    home      attrs['home']      if attrs['home']
    shell     attrs['shell']     if attrs['shell']
    password  attrs['password']  if attrs['password']
    system    attrs['system']    if attrs['system']
    action    attrs['action']    if attrs['action']

    supports  :manage_home => !!attrs['manage_home'],
              :non_unique  => !!attrs['non_unique']
  end

  if !attrs['groups'].nil? && attrs['action'] != 'remove'
    attrs['groups'].each do |groupname|
      group groupname do
        members username
        append true
      end
    end
  end
end
