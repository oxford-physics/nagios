# Nagios plugins and config for checking puppet clients
class nagios::plugins::puppet {
  # check_puppet_checkin
  nagios::plugin { 'check_puppet_checkin': }

  nagios::config::nrpe { 'check_puppet_checkin':
    command => 'check_puppet_checkin 100',
    require => Package['perl-DateTime'],
  }

  # check_puppetmaster
  nagios::config::nrpe { 'check_puppetmaster':
    command => 'check_daemons puppet\ master',
  }

  # check_puppet
  nagios::config::nrpe { 'check_puppet':
    command => 'check_daemons puppet\ agent',
  }

  # check_puppet_environment
  nagios::plugin { 'check_puppet_environment': }

  nagios::config::nrpe { 'check_puppet_environment':
    command => 'check_puppet_environment',
  }
}
