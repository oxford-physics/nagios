# Summary of all monitoring services on the server side
class nagios::services::server {
  # A server is also a client
  class { 'nagios::services::client': }

  class { 'nagios::services::nagios': }
}
