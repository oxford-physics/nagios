# Installation of packages
class nagios::install (
  $ensure    = installed,
  $is_server = false,) {
  # for both client and server
#  class { 'nagios::cron::kernel_passive': }

  $nrpe_name = $::osfamily ? {
    'RedHat' => 'nrpe',
    'Debian' => 'nagios-nrpe-server',
    default  => 'nrpe',
  }

  package { 'nrpe':
    ensure => $ensure,
    name   => $nrpe_name,
  }

  $nsca_client_name = $::osfamily ? {
    'RedHat' => 'nsca-client',
    'Debian' => 'nsca',
    default  => 'nsca-client',
  }

  package { 'nsca-client':
    ensure => $ensure,
    name   => $nsca_client_name,
  }

  package { 'nagios-plugins':
    ensure  => $ensure,
  }

  # OS family specific names
  if $::osfamily == 'RedHat' {
    package { [
      'nagios-plugins-all',
      'nagios-plugins-perl',
      'perl-DateTime']:
      ensure  => $ensure,
    }
  }

  if $::osfamily == 'Debian' {
    package { [
      'nagios-plugins-basic',
      'nagios-plugins-standard',
      'nagios-plugins-extra']:
      ensure => $ensure,
    }

    # Install some perl modules on Debian as they don't seem to get pulled in by
    # any dependencies
    package { 'libnagios-plugin-perl': ensure => $ensure, }
  }

  if $is_server == true { # server only
    package { [
      'nagios',
      'pnp4nagios',
      'nagios-plugins-nrpe',
      'nsca']:
      ensure => $ensure,
    }

    # Install apache web server and add httpd to the nagios group
    class { 'apache':
#      group => 'nagios',  Commented out becuase apache automatically add group to nagios
    }

    # Add PHP support (pnp4nagios & PHP Nagios)
    class { 'apache::php':
    }
  }
}
