class webapp::params {
  case $::osfamily {
    'RedHat': {
      $docroot = '/var/www/vhost'
    }
    default: {
      fail("${::osfamily} not supported.")
    }
  }
}
