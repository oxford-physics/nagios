class nagios::services::client {
  # Now we define generic nagios checks themselves
  # anything else, eg http, goes in relevant module
  include nagios::services::ping
  # ### CURRENT USERS
  include nagios::services::current_users
  # ### LOAD
  include nagios::services::load
  # ### ZOMBIE PROCS
  include nagios::services::zombies
  # ### TOTAL PROCS
  include nagios::services::total_procs
  # ### SWAP
  include nagios::services::swap
  # ### DISK SPACE
  include nagios::services::disk_space
  # yum
  include nagios::services::yum
  # ### MEMORY
  include nagios::services::memory
  # ### UPTIME
  include nagios::services::uptime
  # ### SELINUX
  include nagios::services::selinux
  # ### NRPE
  include nagios::services::nrpe
  # ### AAAA RECORD
  include nagios::services::aaaa_record
  # ### CPU
  include nagios::services::cpu

  # Now add the check for each individual interface on this machine
  $interfaces_array = split($::interfaces, ',')

  nagios::services::tcpcheck { [$interfaces_array]: }

  # Now add the check for each individual disk on this machine
  $disks_array = split($::disks, ',')

  nagios::services::iocheck { [$disks_array]: }
}
