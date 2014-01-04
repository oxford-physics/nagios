# Install a nrpe config snippet to make the plugin accessible
# Some stock plugins lack a NRPE snippet so will need nrpeconfig{}
# without nagiosplugin{}
define nagios::config::nrpe (
  $command,
  $sudo = undef) {
  $file_name   = $::osfamily ? {
    'RedHat' => "/etc/nrpe.d/${title}.cfg",
    'Debian' => "/etc/nagios/nrpe.d/${title}.cfg",
    default  => "/etc/nrpe.d/${title}.cfg",
  }

  $nagios_path = "/usr/${::lib_path}/nagios/plugins/${command}"
  $content     = $sudo ? {
    true    => "command[${title}]=/usr/bin/sudo ${nagios_path}",
    default => "command[${title}]=${nagios_path}",
  }

  file { $file_name:
    alias   => "${title}.cfg",
    content => $content,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nrpe'],
    notify  => Service['nrpe'],
  }
}
