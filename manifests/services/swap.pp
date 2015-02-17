# Check for available swap space
class nagios::services::swap inherits nagios::params {
   nagios::config::nrpe { 'check_swap':
    command => 'check_swap -w 50% -c 20%',
  }

  @@nagios_service { "check_swap_${::fqdn}":
    check_command       => 'check_nrpe!check_swap',
    host_name           => $::fqdn,
    service_description => 'Swap',
    use                 => '5min-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_swap_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Swap',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
