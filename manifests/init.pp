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
class nagios (
  $allowed_hosts = ['127.0.0.1'],
  $is_server     = false,) {
  if $is_server == true {
    class { 'nagios::server': }
  } else {
    class { 'nagios::client': }
  }

}
