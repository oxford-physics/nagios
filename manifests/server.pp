# Nagios config for monitoring servers
class nagios::server (
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
  class { 'nagios::install': is_server => true, }

  class { 'nagios::services::server': }

  class { 'nagios::config::server':
    admins           => $admins,
    hostgroups       => $hostgroups,
    servicegroups    => $servicegroups,
    use_mod_auth_cas => $use_mod_auth_cas,
    cas_login_url    => $cas_login_url,
    cas_users        => $cas_users,
    cas_validate_url => $cas_validate_url,
  }

  Class['nagios::install'] -> Class['nagios::config::server'] ->
  Class['nagios::services::server']
}
