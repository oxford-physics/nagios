# Installation of packages
class nagios::install (
  $is_server = false,) {
  # for both client and server
  include nagios::cron::kernel_passive
  include nagios::plugins::core

  $nrpe_name = $::osfamily ? {
    'RedHat' => 'nrpe',
    'Debian' => 'nagios-nrpe-server',
    default  => 'nrpe',
  }

  package { 'nrpe':
    ensure => installed,
    name   => $nrpe_name,
  }

  $nsca_client_name = $::osfamily ? {
    'RedHat' => 'nsca-client',
    'Debian' => 'nsca',
    default  => 'nsca-client',
  }

  package { 'nsca-client':
    ensure => installed,
    name   => $nsca_client_name,
  }

  package { 'nagios-plugins':
    ensure  => installed,
    require => Class['grid_repos'],
  }

  # OS family specific names
  if $::osfamily == 'RedHat' {
    package { [
      'nagios-plugins-all',
      'nagios-plugins-perl',
      'nagios-plugins-check-tcptraffic',
      'perl-DateTime']:
      ensure  => installed,
      require => Class['grid_repos'],
    }
  }

  if $::osfamily == 'Debian' {
    package { [
      'nagios-plugins-basic',
      'nagios-plugins-standard',
      'nagios-plugins-extra']:
      ensure => installed,
    }

    # Install some perl modules on Debian as they don't seem to get pulled in by
    # any dependencies
    package { 'libnagios-plugin-perl': ensure => installed, }
  }

  if $is_server == true { # server only
    package { [
      'nagios',
      'pnp4nagios',
      'nagios-plugins-nrpe',
      'nsca']:
      ensure => installed,
    }

    # Install apache web server and add httpd to the nagios group
    class { 'apache':
      group => 'nagios',
    }

    # Add PHP support (pnp4nagios & PHP Nagios)
    class { 'apache::php':
    }
  }
}
