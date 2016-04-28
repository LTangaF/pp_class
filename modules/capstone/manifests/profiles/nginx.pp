class capstone::profiles::nginx {
  $port  = hiera('blog_port')
  $dir   = hiera('blog_dir')
  $user  = hiera('blog_user')
  $group = hiera('blog_group')

  include phpfpm
  phpfpm::pool { 'www':
    ensure => absent,
  }
  phpfpm::pool { 'main':
    user  => $user,
    group => $group,
  }

  include nginx
  nginx::resource::vhost { $::fqdn:
    ensure      => present,
    listen_port => $port,
    www_root    => $dir,
    index_files => [ 'index.php' ],
    fastcgi     => '127.0.0.1:9000',
    require     => Phpfpm_pool['main'],
  }
}
