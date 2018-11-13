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

# Don't monitor if ipv6 address is local
  $ipv6add = "${::ipaddress6}" 
  $array_var1 = split($ipv6add, /::/)
  if ($::ipaddress6) { 
    if  ($array_var1[0] != 'fe80') {
    notify { " ping 6 thingy worked" :}
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
}
