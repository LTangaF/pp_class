class system::hashadmins {
  require mysql::server

  $defaults = {
    ensure               => present,
    max_queries_per_hour => 600,
  }

  $mysql_users = {
    'zack@localhost'   => { 'max_queries_per_hour' => 1200 },
    'ralph@localhost'  => { 'ensure' => 'absent' },
    'monica@localhost' => {},
    'brad@localhost'   => {},
    'luke@localhost'   => {},
  }

  create_resources('mysql_user', $mysql_users, $defaults)
}
