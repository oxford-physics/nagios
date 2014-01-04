#Monitor logged in users
class nagios::services::current_users {
  @@nagios_service { "check_users_${::fqdn}":
    check_command       => 'check_nrpe!check_users',
    host_name           => $::fqdn,
    service_description => 'Current users',
    use                 => '5min-service',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_users_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Current users',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
