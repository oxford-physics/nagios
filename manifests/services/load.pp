# Monitoring of the CPU load
class nagios::services::load inherits nagios::params {
  
  nagios::config::nrpe { 'check_load':
  command => 'check_load -r -w 1.6, 1.4, 1.2 -c 2, 1.8, 1.5',
  }
  
  @@nagios_service { "check_load_${::fqdn}":
    check_command       => 'check_nrpe!check_load',
    host_name           => $::fqdn,
    service_description => 'Load',
    use                 => '3min-service',
    servicegroups       => 'load',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_load_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Load',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
