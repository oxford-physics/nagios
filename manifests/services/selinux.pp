# Monitoring of the SELinux component
class nagios::services::selinux {
  @@nagios_service { "check_selinux_${::fqdn}":
    check_command       => 'check_nrpe!check_selinux',
    host_name           => $::fqdn,
    service_description => 'SELinux',
    use                 => 'hourly-service',
    servicegroups       => 'selinux',
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_selinux_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'SELinux',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
