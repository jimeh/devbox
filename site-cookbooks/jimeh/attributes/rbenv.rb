default['rbenv']['user_installs'] = [
  {
    'user'    => 'jimeh',
    'rubies'  => ['1.9.3-p448'],
    'global'  => '1.9.3-p448',
    'gems'    => {
      '1.9.3-p448' => [
        {'name' => 'bundler'},
        {'name' => 'rake'},
        {'name' => 'foreman'},
        {'name' => 'rbenv-rehash'},
        {'name' => 'git_pissed'}
      ]
    }
  }
]
