class nagios::profile::nagios_server {

   include nagios::services::ping
  # ### LOAD
#   include nagios::services::load
  # ### ZOMBIE PROCS
   include nagios::services::zombies
  # ### DISK SPACE
   include nagios::services::disk_space
  # yum
 #  include nagios::services::yum
 # ### MEMORY
   include nagios::services::memory
  # ### NRPE
   include nagios::services::nrpe
  # ### AAAA RECORD
 #  include nagios::services::aaaa_record
  # ### CPU
   # include nagios::services::cpu
  # ### Puppet client
#   include nagios::services::puppet
  # Now add the check for each individual interface on this machine
  # $interfaces_array = split($::interfaces, ',')
  # nagios::services::tcpcheck { [$interfaces_array]: }
  # Now add the check for each individual disk on this machine
# $  disks_array = split($::disks, ',')
# nagios::services::iocheck { [$disks_array]: }

}
