# Nagios config for monitoring servers
class nagios::server {
  class { 'nagios::install': is_server => true, }
  
  include nagios::services::server
  
}
