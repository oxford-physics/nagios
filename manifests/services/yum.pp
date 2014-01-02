class nagios::services::yum {
  #  does notwork with SELinux
  @@nagios_service { "check_yum_${::fqdn}":
    check_command         => "check_nrpe!check_yum",
    host_name             => $::fqdn,
    service_description   => "Yum updates",
    use                   => 'hourly-service',
    notifications_enabled => '0',
    tag                   => $::domain,
  }

  @@nagios_servicedependency { "check_yum_${::fqdn}":
    host_name => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => "Yum updates",
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag       => $::domain,
  }
}
