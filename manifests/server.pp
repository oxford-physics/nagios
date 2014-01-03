# Nagios config for monitoring servers
class nagios::server {
  class { 'nagios::install': is_server => true, }

  class { 'nagios::services::server': }

  class { 'nagios::config::server': }

  Class['nagios::install'] -> Class['nagios::config::server'] ->
  Class['nagios::services::server']
}
