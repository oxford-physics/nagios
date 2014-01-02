# ### DISK I/O
# Set up a little loop that adds a nagios check for each disk
define nagios::services::iocheck {
  if $name !~ /^sr\d/ {
    @@nagios_service { "check_iostat_${::fqdn}_${name}":
      check_command       => "check_nrpe!check_iostat_${name}",
      host_name           => $::fqdn,
      service_description => "I/O ${name}",
      use                 => '5min-service',
      tag                 => $::domain,
    }

    @@nagios_servicedependency { "check_iostat_${::fqdn}_${name}":
      host_name => $::fqdn,
      dependent_host_name           => $::fqdn,
      dependent_service_description => "I/O ${name}",
      service_description           => 'NRPE',
      notification_failure_criteria => 'w,u,c',
      tag       => $::domain,
    }
  }
}
