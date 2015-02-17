# Nagios monitoring for uptime
class nagios::services::uptime inherits nagios::params {
  nagios::plugin { 'check_uptime': }
  nagios::config::nrpe { 'check_uptime': command => 'check_uptime', }
  
  @@nagios_service { "check_uptime_${::fqdn}":
    check_command       => 'check_nrpe!check_uptime',
    host_name           => $::fqdn,
    service_description => 'Uptime',
    use                 => 'hourly-service',
    servicegroups       => 'uptime',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_uptime_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Uptime',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
