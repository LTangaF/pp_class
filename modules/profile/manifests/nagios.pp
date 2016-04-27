class profile::nagios {
  # puppet module install herculesteam/augeasproviders_nagios
  nrpe_command { "check_spec_test":
    ensure  => present,
    command => "/usr/bin/check_my_thing -p 'some command with \"multiple [types]\" of quotes' -x and-stuff",
  }
}
