# ### IPMI
class nagios::services::ipmi (
  $ipmi_notification = '1', ) inherits nagios::params
{
  if $virtual == 'physical' { 
  @@nagios_service { "check_ipmi_${::fqdn}":
    check_command          => "check_http_ipmi!${::ipmi1_ipaddress}",
    host_name              => $::fqdn,
    service_description    => 'IPMI',
    servicegroups          => 'ipmi',
    notifications_enabled  => $ipmi_notification,
    use                    => '12hour-service',
    target		   => "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                    => $nagios_server,
  }
 }
}
