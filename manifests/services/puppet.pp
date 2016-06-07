# ### Puppet 
class nagios::services::puppet inherits nagios::params {

  nagios::plugin { 'check_puppet': }   
  
  nagios::config::nrpe { 'check_puppet':
  command => 'check_puppet -w 3600 -c 7200',
  sudo => true,
}  
  #SB June 2016
  #https://roidelapluie.be/wiki/puppet-no-such-file-to-load-json-loaderror.html
  ensure_packages (ruby-json)
  @@nagios_service { "check_puppet_${::fqdn}":
    check_command       => 'check_nrpe!check_puppet',
    host_name           => $::fqdn,
    service_description => 'puppet',
    use                 => 'hourly-service',
    target		=> "/etc/nagios/nagios_services.d/${::fqdn}.cfg",
    tag                 => $nagios_server,
  }

}
