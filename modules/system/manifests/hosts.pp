class system::hosts {
  host { 'joel.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['joel'],
    ip           => '10.0.1.19',
    target       => '/etc/hosts',
  }
  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '::1',
    target       => '/etc/hosts',
  }
  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['master'],
    ip           => '10.0.1.8',
    target       => '/etc/hosts',
  }
  host { 'student.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['training', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
    target       => '/etc/hosts',
  }

  resources { 'host':
    purge => true,
  }
}
