# Summary of all monitoring services on the server side
class nagios::services::server {
  # A server is also a client
  class { 'nagios::services::client': }

  class { 'nagios::services::nagios': }

  include nagios::commands
  include nagios::plugins::all
  include nagios::plugins::server
  include nagios::templates
  
  # Start the Nagios service, and make it restart if there have been changes to
  # the config
  service { 'nagios':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => false,
    require    => [Package['nagios'], File['nagios.cfg']],
  }

  # NSCA service to accept passive checks
  service { 'nsca':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [Service['nagios'], Package['nsca'], File['nsca.cfg']],
  }
}
