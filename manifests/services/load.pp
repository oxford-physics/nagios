# Monitoring of the CPU load
class nagios::services::load {
  @@nagios_service { "check_load_${::fqdn}":
    check_command       => 'check_nrpe!check_load',
    host_name           => $::fqdn,
    service_description => 'Load',
    use                 => '3min-service',
    servicegroups       => 'load',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_load_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Load',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
