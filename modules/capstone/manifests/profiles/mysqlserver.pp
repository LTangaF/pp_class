class capstone::profiles::mysqlserver {
  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }
}
