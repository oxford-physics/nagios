##
# Sets up the Nagios hostgroups for your monitoring.
# Hostgroups need a name, an alias and a tag. That's it.
# tag should correspond to $::domain
class nagios::config::hostgroups (
  $hostgroups = {
    'default' => {
      alias => 'default-hostgroup',
      tag   => 'everything',
    }
  }
) {
  create_resources('nagios_hostgroup', $hostgroups)
}
