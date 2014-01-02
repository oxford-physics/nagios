class nagios::services::swap {
  @@nagios_service { "check_swap_${::fqdn}":
    check_command       => 'check_nrpe!check_swap',
    host_name           => $::fqdn,
    service_description => 'Swap',
    use                 => '5min-service',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_swap_${::fqdn}":
    host_name => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Swap',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag       => $::domain,
  }
}
