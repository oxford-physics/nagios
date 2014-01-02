# Configures nagios client and sets up basic checks
class nagios::client {
  class { 'nagios::install': }
  
  include nagios::services::client
  
}
