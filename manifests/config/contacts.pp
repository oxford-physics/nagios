# Creates admin contacts for Nagios monitoring
# Each contact needs a name (i.e. user name), an alias (i.e. full name) and an
# email address
# you can also specify a tag these contacts are valid for
class nagios::config::contacts (
  $admins = {
    'admin01' => {
      contact_name => 'admin01',
      alias        => 'Admin for life',
      email        => 'admin01@bristol.ac.uk',
    }
  }
  ,
  $tag    = 'phy.bris.ac.uk',) {
  # we need at least the admins
  nagios_contactgroup { 'admins':
    contactgroup_name => 'admins',
    alias             => 'Nagios Administrators',
    members           => keys($admins),
    tag               => $tag,
  }

  $defaults = {
    use => 'generic-contact',
    tag => $tag,
  }

  create_resources('nagios_contact', $admins, $defaults)

  # everything else is optional
}
