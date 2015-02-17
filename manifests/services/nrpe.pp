#Check if NRPE is running
class nagios::services::nrpe inherits nagios::params {
  @@nagios_service { "check_nrpe_${::fqdn}":
    check_command       => 'check_nrpe_status',
    host_name           => $::fqdn,
    service_description => 'NRPE',
    use                 => '3min-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }
}
