# Nagios checks for total number of processes
class nagios::services::total_procs {
  @@nagios_service { "check_total_procs_${::fqdn}":
    check_command       => 'check_nrpe!check_total_procs',
    host_name           => $::fqdn,
    service_description => 'Processes',
    use                 => '5min-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_total_procs_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Processes',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
