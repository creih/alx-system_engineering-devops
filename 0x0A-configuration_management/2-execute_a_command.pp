# this file executes a kill commad
exec { 'kill_killmenow_process':
  command  => 'pkill -f killmenow',
  unless   => 'pgrep -f killmenow',
  provider => 'shell',
}
