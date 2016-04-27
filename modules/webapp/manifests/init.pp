class webapp (
  $docroot = $::webapp::params::docroot,
) inherits webapp::params {
  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }

  class { 'apache':
    default_vhost => false,
  }

  group { 'wwwdata':
    ensure => present,
  }
  user { 'wwwdata':
    ensure     => present,
    managehome => true,
    gid        => 'wwwdata',
  }

  apache::vhost { $::fqdn:
    port          => '80',
    docroot       => $docroot,
    docroot_owner => 'wwwdata',
    docroot_group => 'wwwdata',
    require       => User['wwwdata'],
  }
}
