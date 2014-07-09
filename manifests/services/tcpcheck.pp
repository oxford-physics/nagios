# ### NETWORK INTERFACE TRAFFIC
# Set up a little loop that adds a nagios check for each interface
define nagios::services::tcpcheck {
  if $name != 'lo' {
    @@nagios_service { "check_tcptraffic_${::fqdn}_${name}":
      check_command       => "check_nrpe!check_tcptraffic_${name}",
      host_name           => $::fqdn,
      service_description => "Network traffic ${name}",
      use                 => '5min-service',
      servicegroups       => 'network',
      target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
      tag                 => $::domain,
    }

    @@nagios_servicedependency { "check_tcptraffic_${::fqdn}_${name}":
      host_name                     => $::fqdn,
      dependent_host_name           => $::fqdn,
      dependent_service_description => "Network traffic ${name}",
      service_description           => 'NRPE',
      notification_failure_criteria => 'w,u,c',
      tag                           => $::domain,
    }
  }
}
