# ### PING
class nagios::services::puppet {
  @@nagios_service { "check_puppet_${::fqdn}":
    check_command       => 'check_nrpe!check_puppet',
    host_name           => $::fqdn,
    service_description => 'puppet',
    use                 => 'hourly-service',
    target		=> "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $::domain,
  }

}
