class system::admins {

  @user { ['bob','sally']:
    ensure => present,
    tag    => 'wordpress',
  }

  @user { 'joe':
    ensure => present,
    tag    => 'oracle',
  }

  @user { 'admin':
    ensure => present,
  }
}
