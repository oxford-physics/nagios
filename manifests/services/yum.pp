# Nagios tests for yum
class nagios::services::yum inherits nagios::params {
   nagios::plugin { 'check_yum': }
   nagios::config::nrpe { 'check_yum': command => 'check_yum --all-updates', }
  
  #  does notwork with SELinux
  @@nagios_service { "check_yum_${::fqdn}":
    check_command         => 'check_nrpe!check_yum',
    host_name             => $::fqdn,
    service_description   => 'Yum updates',
    use                   => 'hourly-service',
    notifications_enabled => '0',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                   => $nagios_server,
  }

  @@nagios_servicedependency { "check_yum_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Yum updates',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
