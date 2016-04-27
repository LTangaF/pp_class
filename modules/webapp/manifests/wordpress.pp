class webapp::wordpress {
  class { 'webapp':
    docroot => '/var/www/joel',
  }

  group { 'wordpress':
    ensure => present,
  }
  user { 'wordpress':
    ensure     => present,
    managehome => true,
    gid        => 'wordpress',
  }

  class { 'wordpress':
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => 'strongpassword',
  }
}
