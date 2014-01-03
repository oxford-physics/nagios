# Monitoring of CPU usage
class nagios::services::cpu {
  @@nagios_service { "check_cpu_${::fqdn}":
    check_command       => 'check_nrpe!check_cpu',
    host_name           => $::fqdn,
    service_description => 'CPU usage',
    use                 => '3min-service',
    servicegroups       => 'cpu',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_cpu_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'CPU usage',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
