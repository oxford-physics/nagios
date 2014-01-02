[] groupadd sudoers (or change group name)
[] add mod_auth_case configuration file (default apache module does not handle mod_auth_cas)
[] nagios::client mvparent and virtual are very custom values at the moment
[] enable PHP for Nagios (or whatever is causing the problem)
[] fix problem of hostdependencies if none are existent: make nagios.cfg into a template!!
[] documentation: for host dependencies to work, both have to be Nagios clients!
[] nrpe config: needs to be a template to include the Nagios server IPs (in our case 1 public and 1 private)
[] add vhost for pnp4nagios
