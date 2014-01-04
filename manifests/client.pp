# Configures nagios client and sets up basic checks
class nagios::client (
  $allowed_hosts = ['127.0.0.1'],) {
  class { 'nagios::install': }

  class { 'nagios::config::client': allowed_hosts => $allowed_hosts, }

  class { 'nagios::services::client': }

  Class['nagios::install'] -> Class['nagios::config::client'] ->
  Class['nagios::services::client']

}
