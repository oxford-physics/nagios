# Summary of all monitoring services on the client side
class nagios::services::client inherits nagios::params {

  $lib = $::architecture ? {
    'i386'   => 'lib',
    'x86_64' => 'lib64',
    default  => 'lib',
  }

  $nrpe_service_name = $::osfamily ? {
    'RedHat' => 'nrpe',
    'Debian' => 'nagios-nrpe-server',
    default  => 'nrpe',
  }

  # Start the monitoring services
  service { 'nrpe':
    ensure     => running,
    name       => $nrpe_service_name,
    require    => [File['/etc/nagios/nrpe.cfg'], Package['nrpe']],
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
 include "nagios::profile::$profile_type"

}
