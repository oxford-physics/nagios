# This class includes a passive Nagios check to monitor the kernel status
class nagios::cron::kernel_passive {
  # Run check on boot
  cron { 'kernel-passive-reboot':
    command => '/usr/lib64/nagios/plugins/check_kernel_passive',
    user    => 'root',
    special => 'reboot',
    require => File['check_kernel_passive'],
  }

  cron { 'kernel-passive-daily':
    ensure      => present,
    environment => ['PATH="/usr/sbin:/usr/bin:/sbin:/bin"'],
    command     => '/usr/lib64/nagios/plugins/check_kernel_passive',
    user        => root,
    hour        => 0,
    minute      => 0,
    month       => '*',
    weekday     => '*',
    require => File['check_kernel_passive'],
  }

  # Symlink to run check in daily cron
  # Should come after 00yum-update
#  file { '/etc/cron.daily/kernel-passive-daily':
#    ensure  => link,
#    target  => '/usr/lib64/nagios/plugins/check_kernel_passive',
#    require => [Package['nsca-client'], File['check_kernel_passive']],
#  }

  # Passive Nagios service definition for the above
  @@nagios_service { "check_kernel_${::fqdn}":
    host_name             => $::fqdn,
    service_description   => 'Kernel',
    use                   => 'hourly-service',
    active_checks_enabled => 0,
    max_check_attempts    => 1,
    check_freshness       => 1,
    freshness_threshold   => 172800,
    check_command         => 'check_dummy!1 "No passive checks for at least 48h"',
    tag                   => $::domain,
    servicegroups         => 'kernel',
  }
}
