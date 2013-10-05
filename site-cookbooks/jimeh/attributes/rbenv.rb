base_gems = [
  {'name' => 'foreman'},
  {'name' => 'rbenv-rehash'},
  {'name' => 'git_pissed'}
]

default['rbenv']['user_installs'] = [
  {
    'user'   => 'jimeh',
    'rubies' => ['1.9.3-p194', '1.9.3-p448', '2.0.0-p247'],
    'global' => '1.9.3-p448',
    'gems'   => {
      '1.9.3-p194' => base_gems + [{'name' => 'bundler'}],
      '1.9.3-p448' => base_gems,
      '2.0.0-p247' => base_gems
    }
  }
]
