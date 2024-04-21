# using puppet to automate the server settings
file { '~/.ssh/config':
    ensure => file,
    mode   => '0600',
    content => "
        Host 54.126.45.57
            IdentityFile ~/.ssh/school
            PasswordAuthentication no
    ",
    owner  => 'ubuntu',
}
