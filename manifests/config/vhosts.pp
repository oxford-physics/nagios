# Creating virtual hosts for the Nagios server
# Currently only the CAS authentication method is supported
class nagios::config::vhosts (
  $use_mod_auth_cas = true,
  $cas_login_url    = undef,
  $cas_users        = [],
  $cas_validate_url = undef,) {
  # since puppetlabs/apache does not support mod_cas, we need to manually create
  # this file
  if $use_mod_auth_cas == true {
    file { '/etc/httpd/conf.d/00-cas_auth.conf':
      alias   => '00-cas_auth.conf',
      content => template("${module_name}/00-cas_auth.conf.erb")
    }
  }
  $allowed_users = join($cas_users, ' ')

  # Combined apache config for nagios and pnp4nagios
  apache::vhost { 'Nagios':
    port              => 80,
    docroot           => '/usr/lib64/nagios/cgi-bin',
    servername        => $::fqdn,
    serveraliases     => [$::fqdn],
    error_log_file    => 'logs/nagios_error_log',
    access_log_file   => 'logs/nagios_access_log',
    access_log_format => 'common',
    directoryindex    => 'index.php',
    scriptaliases     => [{
        alias => '/nagios/cgi-bin/',
        path  => '/usr/lib64/nagios/cgi-bin/'
      }
      ,],
    aliases           => [{
        alias => '/nagios',
        path  => '/usr/share/nagios/html'
      }
      ],
    directories       => [
      {
        path           => '/usr/lib64/nagios/cgi-bin/',
        options        => [
          '+ExecCGI'],
        allow_override => ALL,
        order          => 'allow,deny',
        allow          => 'from all',
        auth_type      => 'CAS',
        auth_require   => "user ${allowed_users}",
      }
      ,
      {
        path           => '/usr/share/nagios/html',
        allow_override => ALL,
        order          => 'allow,deny',
        allow          => 'from all',
        auth_type      => 'CAS',
        auth_require   => "user ${allowed_users}",
      }
      ],
  }

  # Remove stock nagios and pnp configs because they don't work
  # They will be replaced when the RPM is upgraded so keep this block
  file { ['/etc/httpd/conf.d/nagios.conf', '/etc/httpd/conf.d/pnp4nagios.conf']:
    ensure  => absent,
    require => Package['httpd', 'nagios'],
  }
}
