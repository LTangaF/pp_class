class capstone::profiles::wordpress {
  $wp_dir = hiera('blog_dir')
  $wp_owner = hiera('blog_owner')
  $wp_group = hiera('blog_group')

  require mysql::server

  file { $wp_dir:
    ensure => directory,
    owner  => $wp_owner,
    group  => $wp_group,
    mode   => '0700',
  }

  class { 'wordpress':
    wp_owner    => $wp_owner,
    wp_group    => $wp_group,
    install_dir => $wp_dir,
    db_user     => 'wordpress',
    db_password => 'secretwordpresspassword',
    require     => [File[$wp_dir], Class['mysql::server']],
  }
}
