Puppet Nagios module
=====================
This module is based on the internal puppet module of the University of Bristol IT services. 
Many thanks to @djjudas21 and Paul for providing the source and documentation. 

This module to sets up Nagios monitoring for your infrastructure which includes:
 * core: domain, CPU, daemons, I/O, networker, memory usage, load, uptime, yum, selinux, certificate, smtp, swap, zombies, users, cron, NTP, TCP traffic, openmanage, xinetd, DNS
 * bind: named status
 * dhcp: dhcpd status, pools, failover
 * mysql: Queries Per Second (QPS), Multi-Master replication Manager (MMM), DB size, 
 * nagios client: config, stats
 * nagios server: config, apache, AAAA record, NRPE
 * puppet: last run, environment, master, DB
 
 
Usage
====================
Server Installation

 include nagios

passed these parameters from Hiera

  nagios::is_server: true

  nagios::use_mod_auth_cas: false

  nagios::params::nagios_server: 'FQDN of server'

  nagios::params::profile_type: 'nagios_server'

  nagios::allowed_hosts:

      - 'FQDN of Server''




Contribution
====================
Please read CONTRIBUTING.md.
