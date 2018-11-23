# Monitoring disk space
class nagios::services::disk_space (
     $disk_space_command = 'check_disk -l -X fuse -X fuse.xrdp-chansrv -x /dev/shm -w 10% -c 5%'

 )inherits nagios::params {
  
  nagios::config::nrpe { 'check_disk_all':
   command => $disk_space_command,
  }  
  
  @@nagios_service { "check_disk_${::fqdn}":
    check_command       => 'check_nrpe!check_disk_all',
    host_name           => $::fqdn,
    service_description => 'Disk space',
    use                 => 'hourly-service',
    target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  @@nagios_servicedependency { "check_disk_${::fqdn}":
    host_name                     => $::fqdn,
    dependent_host_name           => $::fqdn,
    dependent_service_description => 'Disk space',
    service_description           => 'NRPE',
    notification_failure_criteria => 'w,u,c',
    tag                           => $nagios_server,
  }
}
