class role::logserver {
  include profile::base
  include profile::splunk_server
  include profile::influxdb_server
  include profile::grafana
}
