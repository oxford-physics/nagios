##
# Sets up the Nagios servicegroups for your monitoring.
# Servicegroups need a name, an alias and a tag. That's it.
# tag should correspond to $::domain
class nagios::config::servicegroups (
  $servicegroups = {
    'cpu' => {
      alias => 'CPU',
      tag   => $::domain,
    }
  }
) {
  create_resources('nagios_servicegroup', $servicegroups)
}
