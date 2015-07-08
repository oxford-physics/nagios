## to check new tests 
class nagios::profile::test {
   include  nagios::cron::kernel_passive
   include nagios::services::ping
   #include nagios::services::current_users
   include nagios::services::load
   include nagios::services::zombies
   #include nagios::services::total_procs
   include nagios::services::swap
   include nagios::services::disk_space
   include nagios::services::yum
   #include nagios::services::memory
   #include nagios::services::uptime
   include nagios::services::nrpe
   #include nagios::services::aaaa_record
  # ### CPU
   # include nagios::services::cpu
  # ### Puppet client
   include nagios::services::puppet
  # Now add the check for each individual interface on this machine
  # $interfaces_array = split($::interfaces, ',')
  # nagios::services::tcpcheck { [$interfaces_array]: }
  # Now add the check for each individual disk on this machine
# $  disks_array = split($::disks, ',')
# nagios::services::iocheck { [$disks_array]: }

}
