# Nagios plugins and config for checking ESX(i) servers
class nagios::plugins::esx {
  nagios::plugin { 'check_esx_hardware': }

  nagios::plugin { 'check_esx_cpu': }

  nagios::plugin { 'check_esx': }

  nagios::plugin { 'check_esx_memory': }
}
