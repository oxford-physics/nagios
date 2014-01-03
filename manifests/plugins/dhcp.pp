# Nagios plugins and config for DHCP servers
class nagios::plugins::dhcp {
  package { 'dhcpd-pools':
    ensure => installed,
  }

  # check_dhcpd_pools - RNW version
  nagios::plugin { 'check_dhcpd_pools':
    require => Package['dhcpd-pools'],
  }

  nagios::config::nrpe { 'check_dhcpd_pools':
    command => 'check_dhcpd_pools',
  }

  # check_dhcpd_pools - universal version
  # requires check_nrpe_gz_b64
  nagios::plugin { 'check_dhcpd_pools_gz_b64':
    require => Package['dhcpd-pools'],
  }

  nagios::config::nrpe { 'check_dhcpd_pools_gz_b64':
    command => 'check_dhcpd_pools_gz_b64',
  }

  # check_dhcpd_failover
  nagios::plugin { 'check_dhcpd_failover': }

  nagios::config::nrpe { 'check_dhcpd_failover':
    command => 'check_dhcpd_failover',
  }

  # check_dhcpd
  nagios::config::nrpe { 'check_dhcpd':
    command => 'check_daemons dhcpd',
  }
}
