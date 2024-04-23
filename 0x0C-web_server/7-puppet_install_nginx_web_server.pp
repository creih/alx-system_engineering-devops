# Define the nginx class
class { 'nginx':
  ensure       => 'installed',
  manage_repo  => true,
}

# Configure Nginx to listen on port 80
nginx::resource::vhost { 'example.com':
  ensure        => present,
  listen_port   => '80',
  proxy         => 'http://localhost:8080', # Proxy to handle redirects
  proxy_set_header => ['Host $host', 'X-Real-IP $remote_addr', 'X-Forwarded-For $proxy_add_x_forwarded_for', 'X-Forwarded-Proto $scheme'],
}

# Define the redirection resource
nginx::resource::location { '/redirect_me':
  ensure      => present,
  vhost       => 'example.com',
  location    => '^/redirect_me',
  return      => '301 https://example.com/new_location',
}

# Define a custom index page
file { '/usr/share/nginx/html/index.html':
  ensure  => present,
  content => "Hello World!\n",
}

# Restart the Nginx service after configuration changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => [File['/usr/share/nginx/html/index.html'], Nginx::Resource::Location['/redirect_me']],
}
