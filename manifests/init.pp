# Class: nagios
#
# This module manages nagios
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nagios ($is_server = false,) {
  if $is_server == true {
    class { 'nagios::server': }
  } else {
    class { 'nagios::client': }
  }

}
