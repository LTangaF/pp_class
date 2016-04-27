class profile::splunk {
  # puppet module install example42-splunk
  class { "splunk":
    install        => "forwarder", # This is the default, can be omitted
    forward_server => [ "splunk.example42.com:9997", ], # Must be an array; use host:port format
  }
}
