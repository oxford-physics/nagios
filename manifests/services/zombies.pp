#Nagios monitoring for zombie processes
class nagios::services::zombies inherits nagios::params {
  
   nagios::config::nrpe { 'check_zombie_procs':
    command => 'check_procs -w 20 -c 40 -s Z',
  }
  @@nagios_service { "check_zombie_procs_${::fqdn}":
    check_command       => 'check_nrpe!check_zombie_procs',
    host_name           => $::fqdn,
    service_description => 'Zombie procs',
    use                 => '5min-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    notifications_enabled => false,
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_zombie_procs_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Zombie procs',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
