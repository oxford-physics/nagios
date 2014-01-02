# Core Nagios plugins used only on the nagios server
# These plugins DO NOT need NRPE
class nagios::plugins::server {
  nagios::plugin { 'check_apache': }
  nagios::plugin { 'check_aaaa': }
  nagios::plugin { 'check_nagios_config_passive': }
  nagios::plugin { 'check_nrpe_gz_b64_server': }
}
