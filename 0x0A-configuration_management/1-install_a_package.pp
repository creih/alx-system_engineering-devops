# task 1 kwenstalla flask
exec { 'update_flask':
  command  => '/usr/bin/pip3 install --upgrade flask',
  unless   => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  provider => 'shell',
}

# Install Flask version 2.1.0
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Exec['update_flask'],
}
