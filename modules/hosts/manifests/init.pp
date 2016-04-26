class hosts {

  Host {
    target => '/etc/hosts',
    ensure => present,
  }

  @@host { $::networking['fqdn']:
    host_aliases =>  $::networking['hostname'],
    ip           => [$::networking['interfaces']['eth0']['bindings'][0]['address']],
    tag          => 'classroom',
  }

  host { 'localhost':
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '::1',
  }

  host { 'master.puppetlabs.vm':
    host_aliases => ['master'],
    ip           => '10.0.1.8',
  }

  host { 'student.puppetlabs.vm':
    host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
  }

  Host <<| tag == 'classroom' |>>

  resources { 'host':
    purge => true,
  }
}
