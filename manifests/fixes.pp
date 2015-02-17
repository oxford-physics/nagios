# ## Fixes the file permissions for the Nagios configs.
# The permissions are set to root due to a shortcoming in the
# puppet nagios resource:
# https://tickets.puppetlabs.com/browse/PUP-1327
class nagios::fixes {
  exec { 'fix_nagios_permissions':
    command => 'chown -R root:nagios /etc/nagios/nagios* ; chmod -R 640 /etc/nagios/nagios*.cfg ; chmod -R 640 /etc/nagios/nagios_services.d/*.cfg ; chmod -R 640 /etc/nagios/nagios_hosts.d/*.cfg;',
    # test if already owned by root:nagios group
    onlyif  => 'test $(find /etc/nagios/nagios* ! -user root -o ! -group nagios | wc -l) -gt 0',
    path    => ['/bin', '/usr/bin'],
  }
}
