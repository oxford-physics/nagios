# ### PING
class nagios::services::ping inherits nagios::params {
  @@nagios_service { "check_ping_${::fqdn}":
    check_command       => 'check_icmp',
    host_name           => $::fqdn,
    service_description => 'Ping',
    use                 => '3min-service',
    target		=> "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

  if ($::ipaddress6) {
    @@nagios_service { "check_ping_v6_${::fqdn}":
      check_command       => "check_ping_v6!${::ipaddress6}",
      host_name           => $::fqdn,
      service_description => 'Ping IPv6',
      use                 => '1min-service',
      target              => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
      tag                 => $nagios_server,
    }
  }
}
