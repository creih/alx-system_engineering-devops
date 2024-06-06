# iyi puppet fixes the bug by installing and checking for apache files
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  source  => 'puppet:///modules/apache/000-default.conf',
  mode    => '0644',
  owner   => 'root',
  group   => 'root',
  require => Package['apache'],
}

service { 'apache':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/apache2/sites-available/000-default.conf'],
}
