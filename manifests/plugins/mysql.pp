# Nagios plugins and config for MySQL servers
class nagios::plugins::mysql {
  # check_mysql_qps
  nagios::plugin { 'check_mysql_qps': }

  nagios::config::nrpe { 'check_mysql_qps':
    command => 'check_mysql_qps',
  }

  # check_mmm
  nagios::plugin { 'check_mmm': }

  nagios::config::nrpe { 'check_mmm':
    command => 'check_mmm',
  }

  # check_mysql_dbsize
  nagios::plugin { 'check_mysql_dbsize': }

  nagios::config::nrpe { 'check_mysql_dbsize':
    command => 'check_mysql_dbsize',
  }

  # check_mmm_node
  nagios::plugin { 'check_mmm_node': }

  nagios::config::nrpe { 'check_mmm_node':
    command => 'check_mmm_node',
  }

  # check_mysql_all
  nagios::plugin { 'check_mysql_all': }

  nagios::config::nrpe { 'check_mysql_all':
    command => 'check_mysql_all',
  }

  # check_mysql_cache
  #  nagios::plugin { 'check_mysql_cache':
  #  }
  #  nagios::config::nrpe   { 'check_mysql_cache':
  #    command => 'check_mysql_cache',
  #  }

  # check_mysql_conns
  nagios::plugin { 'check_mysql_conns': }

  nagios::config::nrpe { 'check_mysql_conns':
    command => 'check_mysql_conns',
  }
}
