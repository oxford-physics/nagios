class nagios::services::server {
  include nagios::services::client
  include nagios::services::nagios
}
