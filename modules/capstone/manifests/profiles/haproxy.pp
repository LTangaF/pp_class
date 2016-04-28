class capstone::profiles::haproxy {
  #  $port = hiera('blog_port') ? hiera('blog_port') | '8080'

  @@haproxy::balancemember { 'joel':
    listening_service => 'web00',
    server_names      => $::fqdn,
    ipaddresses       => $::ipaddress,
    ports             => $port,
  }
}
