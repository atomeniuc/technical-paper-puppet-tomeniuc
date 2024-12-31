# Ensure NGINX is installed
package { 'nginx':
  ensure => installed,
}

# Configure the default NGINX website
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80;
      server_name localhost;
      location / {
        root /var/www/html;
        index index.html;
      }
    }
  ",
  require => Package['nginx'], # Ensures this runs after the NGINX package is installed
}

# Deploy a simple HTML file
file { '/var/www/html/index.html':
  ensure  => file,
  content => "<h1>Welcome to my NGINX server!</h1>",
  require => Package['nginx'],
}

# Ensure NGINX service is running and enabled
service { 'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}