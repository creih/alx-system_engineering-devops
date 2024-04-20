# this file executes a kill commad
exec { 'kill_killmenow_process':
  command  => 'pkill -f killmenow',
  onlyif   => 'pgrep -f killmenow',
  provider => 'shell',
}
