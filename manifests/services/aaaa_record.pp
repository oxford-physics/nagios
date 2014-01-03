# Monitoring of AAAA record for IPv6 boxes
class nagios::services::aaaa_record {
  # Only for IPv6 boxes
  if ($::ipaddress6) {
    @@nagios_service { "check_aaaa_${::fqdn}":
      check_command       => 'check_aaaa',
      host_name           => $::fqdn,
      service_description => 'AAAA record',
      use                 => 'hourly-service',
      tag                 => $::domain,
    }
  }
}
