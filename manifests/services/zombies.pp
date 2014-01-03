#Nagios monitoring for zombie processes
class nagios::services::zombies {
  @@nagios_service { "check_zombie_procs_${::fqdn}":
    check_command       => 'check_nrpe!check_zombie_procs',
    host_name           => $::fqdn,
    service_description => 'Zombie procs',
    use                 => '5min-service',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_zombie_procs_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Zombie procs',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
