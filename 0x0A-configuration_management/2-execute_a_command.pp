# this file executes a kill commad
exec { 'killmenow':
  command  => 'pkill -f killmenow',
  unless   => 'pgrep -f killmenow',
  provider => 'shell',
}
