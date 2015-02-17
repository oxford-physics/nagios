# Monitoring of RAM
class nagios::services::memory inherits nagios::params {
    nagios::config::nrpe { 'check_memory':
    command => 'check_memory -w 20% -c 10%',
     }
  
  @@nagios_service { "check_memory_${::fqdn}":
    check_command       => 'check_nrpe!check_memory',
    host_name           => $::fqdn,
    service_description => 'Memory',
    use                 => '3min-service',
    servicegroups       => 'memory',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_memory_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Memory',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
