# Monitoring disk space
class nagios::services::disk_space {
  @@nagios_service { "check_disk_${::fqdn}":
    check_command       => 'check_nrpe!check_disk_all',
    host_name           => $::fqdn,
    service_description => 'Disk space',
    use                 => 'hourly-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $::domain,
  }

  @@nagios_servicedependency { "check_disk_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Disk space',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $::domain,
  }
}
