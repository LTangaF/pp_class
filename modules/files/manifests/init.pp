class files {
  file { '/etc/cron.allow':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { 'cron_allow_root':
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
    match  => '^root',
  }

  file_line { 'cron_deny_all':
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
    match  => '^\*',
  }

  $motd = '/etc/motd'
  concat { $motd:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  files::motd_message { "Welcome to Puppet Managed node ${::fqdn}.":
    order => 1,
  }

  concat::fragment { 'motd body':
    target  => $motd,
    content => template('files/motd_body.erb'),
    order   => 2,
  }
}
