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
  $allowed_hosts    = ['127.0.0.1'],
  $is_server        = false,
  $admins           = {
    'admin01' => {
      contact_name => 'admin01',
      alias        => 'Admin for life',
      email        => 'admin01@bristol.ac.uk',
    }
  }
  ,
  $hostgroups       = {
    'default' => {
      alias => 'default-hostgroup',
      tag   => $::domain,
    }
  }
  ,
  $servicegroups    = {
    'cpu' => {
      alias => 'CPU',
      tag   => $::domain,
    }
  }
  ,
  $use_mod_auth_cas = true,
  $cas_login_url    = undef,
  $cas_users        = [],
  $cas_validate_url = undef,) {
  if $is_server == true {
    class { 'nagios::server':
      admins           => $admins,
      hostgroups       => $hostgroups,
      servicegroups    => $servicegroups,
      use_mod_auth_cas => $use_mod_auth_cas,
      cas_login_url    => $cas_login_url,
      cas_users        => $cas_users,
      cas_validate_url => $cas_validate_url,
    }
  } else {
    class { 'nagios::client': allowed_hosts => $allowed_hosts, }
  }

}
